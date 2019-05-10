CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ELECTRONIC_WALLET`(
_electronic_wallet_id INT
)
BEGIN
DELETE FROM  electronic_wallet WHERE electronic_wallet_id = _electronic_wallet_id;
END