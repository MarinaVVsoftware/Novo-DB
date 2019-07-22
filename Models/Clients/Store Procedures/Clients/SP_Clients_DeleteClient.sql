/* SP SP_Clients_DeleteClient: Elimina un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Clients_DeleteClient`(
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

    UPDATE clients SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE client_id = _client_id
    AND logical_deleted = 0;
END