CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_ELECTRONIC_WALLET`(
_marina_amount DOUBLE,
_Logical_deleted INT
)
BEGIN
INSERT INTO electronic_wallet(marina_amount,Logical_deleted)VALUES(_marina_amount,_Logical_deleted);
END