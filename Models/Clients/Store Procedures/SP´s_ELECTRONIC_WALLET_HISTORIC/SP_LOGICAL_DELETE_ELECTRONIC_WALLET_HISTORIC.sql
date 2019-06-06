CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGICAL_DELETE_ELECTRONIC_WALLET_HISTORIC`(_electronic_wallet_historic_id INT)
BEGIN
UPDATE Electronic_Wallet_Historic SET Logical_Delete = 1 WHERE electronic_wallet_historic_id = _electronic_wallet_historic_id;
END