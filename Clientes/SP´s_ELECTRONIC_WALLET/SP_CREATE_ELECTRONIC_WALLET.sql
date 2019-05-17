CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_ELECTRONIC_WALLET`(
_marina_amount DOUBLE
)
BEGIN
INSERT INTO electronic_wallet(marina_amount)VALUES(_marina_amount);
END