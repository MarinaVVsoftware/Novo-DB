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
        SIGNAL SQLSTATE "45000";
    END IF;

    SELECT 
       	client_id AS clientId,
        status_id AS statusId,
        name,
        email,
        phone,
        address,
        creation_date AS creationDate
    FROM clients
    WHERE client_id = _client_id
    AND logical_deleted = 0;
END