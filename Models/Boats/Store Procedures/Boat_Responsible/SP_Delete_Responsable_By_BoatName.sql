/* SP SP_DELETE_RESPONSABLE_BY_BOATNAME: Elimina un responsable */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_RESPONSABLE_BY_BOATNAME`(
    _boat_name VARCHAR(100)
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE name = _boat_name 
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Boat does exist. Can't bring back responsable with no boat.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    /* verifica que exista el responsable. si no existe truena. */
    IF NOT EXISTS (
        SELECT 1 FROM responsible 
        WHERE boat_id = @boat 
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Responsable doesn't exist. Can't delete responsable.";
    ELSE
        /* obtiene el id del responsable para modificarlo */
        SELECT responsable_id INTO @responsable 
        FROM responsible 
        WHERE boat_id = @boat 
        AND logical_deleted = 0;

        UPDATE responsible SET
            logical_deleted = 1,
            logical_deleted_date = NOW()
        WHERE responsable_id = @responsable;
    END IF;
END