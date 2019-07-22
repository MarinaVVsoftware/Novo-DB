/* SP SP_ElectronicWallet_GetWallet: Trae el monedero de un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ElectronicWallet_GetWallet`(
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
        electronic_wallet_id AS electronicWalletId,
       	client_id AS clientId,
        marina_amount AS marinaAmount
    FROM electronic_wallet
    WHERE client_id = _client_id;
END