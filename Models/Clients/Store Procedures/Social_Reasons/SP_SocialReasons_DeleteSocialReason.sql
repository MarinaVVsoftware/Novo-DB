/* SP SP_SocialReasons_DeleteSocialReason: Elimina una razón social. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SocialReasons_DeleteSocialReason`(
    _client_id INT,
    _rfc VARCHAR(50)
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

    IF NOT EXISTS (
        SELECT 1 FROM social_reasons
        WHERE rfc = _rfc
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45001";
    END IF;

    UPDATE social_reasons SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE rfc = _rfc;
END