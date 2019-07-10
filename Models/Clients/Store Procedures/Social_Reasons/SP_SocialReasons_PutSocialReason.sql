/* SP SP_SocialReasons_PutSocialReason: Crea o Modifica una razón social. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SocialReasons_PutSocialReason`(
    _client_id INT,
    _rfc VARCHAR(50),
    _social_reason VARCHAR(200),
    _cfdi VARCHAR(50),
    _email VARCHAR(100),
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
        SET MESSAGE_TEXT = "Client was not found. Can't put social reason without a client id valid.";
    END IF;

    IF EXISTS (
        SELECT 1 FROM social_reasons 
        WHERE rfc = _rfc
    )
    THEN
        UPDATE social_reasons SET
            social_reason = _social_reason,
            cfdi = _cfdi,
            email = _email,
            address = _address
        WHERE rfc = _rfc
        AND logical_deleted = 0;
    ELSE
        INSERT INTO social_reasons (
            client_id,
            rfc,
            social_reason,
            cfdi,
            email,
            address
        )
        VALUES (
            _client_id,
            _rfc,
            _social_reason,
            _cfdi,
            _email,
            _address
        );
    END IF;
END