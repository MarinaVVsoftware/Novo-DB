CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ELECTRONIC_WALLET`()
BEGIN
SELECT * FROM  electronic_wallet WHERE Logical_deleted = 0;
END