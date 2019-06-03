/* SP SP_Engines_DeleteByBoat: Elimina un motor. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Engines_DeleteByBoat`(
    _client_id INT,
    _boat_name VARCHAR(100)
)
BEGIN

    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM clients 
        WHERE client_id = _client_id
        AND logical_deleted = 0
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
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't delete engine without a boat name valid.";
    END IF;

    /* Verifica si el cliente tiene un bote con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND name = _boat_name
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name
    AND logical_deleted = 0;

    /* Verifica si el bote tiene un engine con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM engines 
        WHERE engine_id = _engine_id 
        AND boat_id = @boat
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that engine related with that boat.";
    END IF;
    
    UPDATE engines SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE boat_id = @boat
    AND logical_deleted = 0;
END