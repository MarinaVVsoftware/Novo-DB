CREATE DEFINER
=`root`@`localhost` PROCEDURE `SP_UPDATE_ELECTRONIC_WALLET`
(
_electronic_wallet_id INT,
_marina_amount DOUBLE,
_logical_deleted INT
)
BEGIN
    UPDATE electronic_wallet SET marina_amount = _marina_amount,Logical_deleted=0 WHERE  electronic_wallet_id = _electronic_wallet_id;
END