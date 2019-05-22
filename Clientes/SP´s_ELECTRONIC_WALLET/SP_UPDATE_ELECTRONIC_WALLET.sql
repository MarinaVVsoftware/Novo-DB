CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ELECTRONIC_WALLET`(
_electronic_wallet_id INT,
_marina_amount DOUBLE
)
BEGIN
UPDATE electronic_wallet SET marina_amount = _marina_amount WHERE  electronic_wallet_id = _electronic_wallet_id;
END