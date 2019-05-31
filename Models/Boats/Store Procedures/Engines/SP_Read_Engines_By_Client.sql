/* SP SP_READ_ENGINES_BY_CLIENT: Trae los motores de un barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ENGINES_BY_CLIENT`(
    _client_id INT
)
BEGIN
    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Clients 
        WHERE client_id = _client_id
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't read boats without a client id.";
    END IF;
    
    /* obtiene todos los engines de cada bote de un cliente */
    SELECT 
        engine_id,
        boat_id,
        model,
        brand
    FROM engines 
    WHERE boat_id 
    IN (
        SELECT boat_id 
        FROM boats 
        WHERE client_id = _client_id
    )
    AND engines.logical_deleted = 0;
END