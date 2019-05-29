/* SP SP_DELETE_CAPTAIN_BY_BOATNAME: Elimina un capitán */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CAPTAIN_BY_BOATNAME`(
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
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat does exist. Can't bring back captain with no boat.";
    END IF;

    SELECT boat_id INTO @boat FROM boats WHERE name = _boat_name;

    /* verifica que exista el capitan. si no existe truena. */
    IF NOT EXISTS (
        SELECT 1 FROM captains 
        WHERE boat_id = @boat 
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Captain doesn't exist. Can't delete captain.";
    ELSE
        /* obtiene el id del capitan para modificarlo */
        SELECT captain_id INTO @captain 
        FROM captains 
        WHERE boat_id = @boat 
        AND logical_deleted = 0;

        /* Actualiza la row del capitán */
        UPDATE captains SET
            logical_deleted = 1,
            logical_deleted_date = NOW()
        WHERE captain_id = @captain;
    END IF;
END