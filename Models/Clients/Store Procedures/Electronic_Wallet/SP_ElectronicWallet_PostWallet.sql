/* SP SP_ElectronicWallet_PutWallet: Crea el monedero de un cliente,
solo sucede al crear al cliente por lo que no es necesario validar nada. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ElectronicWallet_PutWallet`(
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

        /* verifica que no exista ya el monedero. de lo contrario tira una excepción. */   
    IF EXISTS (
        SELECT 1 FROM electronic_wallet
        WHERE client_id = _client_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45001";
    END IF;

    INSERT INTO electronic_wallet (
        client_id
    )
    VALUES (
        _client_id
    );
END