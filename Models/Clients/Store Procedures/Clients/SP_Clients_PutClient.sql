/* SP SP_Clients_PutClient: Modifica un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Clients_PutClient`(
    _client_id INT,
    _status_id INT,
    _name VARCHAR(200),
    _email VARCHAR(200),
    _phone VARCHAR(20),
    _address VARCHAR(300)
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
        SET MESSAGE_TEXT = "Client was not found. Can't put client without a client id valid.";
    END IF;

    /* verifica que exista el status. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM status 
        WHERE status_id = _status_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Status doesn't exist. Can't put client.";
    END IF;

    UPDATE clients SET
        status_id = _status_id,
        name = _name,
        email = _email,
        phone = _phone,
        address = _address
    WHERE client_id = _client_id
    AND logical_deleted = 0;
END