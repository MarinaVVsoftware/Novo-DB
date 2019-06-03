CREATE DEFINER
=`root`@`localhost` PROCEDURE `SP_LOGICAL_DELETED_ELECTRONIC_WALLET`
(
_electronic_wallet_id INT,
_marina_amount DOUBLE,
_Logical_deleted INT
)
BEGIN
    UPDATE electronic_wallet SET marina_amount =_marina_amount , Logical_deleted = 1 WHERE electronic_wallet_id = _electronic_wallet_id;
END