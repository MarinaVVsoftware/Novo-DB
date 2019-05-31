/* SP SP_READ_ENGINES_BY_BOAT: Trae los motores de un barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ENGINES_BY_BOAT`(
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
        SET MESSAGE_TEXT = "Client was not found. Can't read engines without a client id.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats
        WHERE name = _boat_name
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat doesn't exist.";
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
        /* obtiene todos los engines de un bote. */
        SELECT 
            engine_id,
            boat_id,
            model,
            brand
        FROM engines 
        WHERE engines.boat_id = @boat
        AND engines.logical_deleted = 0;
    END IF;
END