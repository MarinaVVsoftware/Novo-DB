/* SP SP_READ_RESPONSABLE: Trae el responsable de un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_RESPONSABLE`(
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
        SET MESSAGE_TEXT = "Client was not found. Can't read responsable without a client id valid.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name
        AND boats.logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat does exist. Can't bring back responsable with no boat.";
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
    ELSE
        SELECT * FROM responsible 
        WHERE boat_id = @boat
        AND logical_deleted = 0;
    END IF;
END