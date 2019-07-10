/* SP SP_SocialReasons_GetSocialReasons: Trae la lista de razones sociales de un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SocialReasons_GetSocialReasons`(
    _client_id INT
)
BEGIN
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