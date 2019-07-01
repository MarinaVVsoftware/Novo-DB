/* SP SP_Clients_GetClientById: Trae un cliente basado en su id. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Clients_GetClientById`(
    _client_id INT
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
        SET MESSAGE_TEXT = "Client was not found. Can't get client without a client id valid.";
    END IF;

    SELECT 
       	client_id,
        status_id,
        name,
        email,
        phone,
        address,
        creation_date
    FROM clients
    WHERE client_id = _client_id
    AND logical_deleted = 0;
END