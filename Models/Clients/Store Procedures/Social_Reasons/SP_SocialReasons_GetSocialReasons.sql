/* SP SP_SocialReasons_GetSocialReasons: Trae la lista de razones sociales de un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SocialReasons_GetSocialReasons`(
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
       	social_reason_id AS socialReasonId,
        client_id AS clientId,
        rfc,
       	social_reason AS socialReason,
        cfdi,
        email,
        address
    FROM social_reasons 
    WHERE client_id = _client_id
    AND logical_deleted = 0;
END