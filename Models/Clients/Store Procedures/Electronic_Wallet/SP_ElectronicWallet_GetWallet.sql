/* SP SP_ElectronicWallet_GetWallet: Trae el monedero de un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ElectronicWallet_GetWallet`(
    _client_id INT
)
BEGIN
    SELECT 
        electronic_wallet_id AS electronicWalletId,
       	client_id AS clientId,
        marina_amount AS marinaAmount
    FROM electronic_wallet
    WHERE client_id = _client_id;
END