/* SP SP_DELETE_ENGINE_BY_BOATNAME: Elimina un motor. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ENGINE_BY_BOATNAME`(
    _client_id INT,
    _boat_name VARCHAR(100)
)
BEGIN

    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM clients 
        WHERE client_id = _client_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't delete engine without a client id.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't delete engine without a boat name valid.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    /* Verifica si el cliente tiene un bote con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND boat_id = @boat
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
    END IF;

    /* Verifica si el bote tiene un engine con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM engines 
        WHERE engine_id = _engine_id 
        AND boat_id = @boat
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that engine related with that boat.";
    ELSE
        UPDATE engines SET
            logical_deleted = 1,
            logical_deleted_date = NOW()
        WHERE boat_id = @boat;
    END IF;
END