/* SP SP_DELETE_BOAT_ELECTRICITY: Elimina una relación de configuración eléctrica. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT_ELECTRICITY`(
    _boat_name VARCHAR(100), 
    _boat_electricity_id INT
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't delete boat electricity without a boat name valid.";
    END IF;

    /* verifica que exista la relación eléctrica. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boat_electricity 
        WHERE boat_electricity_id = _boat_electricity_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat electricity was not found. Can't delete boat electricity.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

     /* Verifica si el bote tiene una relación eléctrica con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boat_electricity 
        WHERE boat_electricity_id = _boat_electricity_id 
        AND boat_id = @boat 
    ) 
    THEN
         /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat electricity related with that boat.";
    ELSE
        UPDATE boat_electricity SET
            logical_deleted = 1,
            logical_deleted_date = NOW()
        WHERE boat_electricity_id = _boat_electricity_id;
    END IF;
END