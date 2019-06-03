CREATE DEFINER
=`root`@`localhost` PROCEDURE `SP_READ_ELECTRONIC_WALLET_HISTORIC`
()
BEGIN
    SELECT *
    FROM electronic_wallet_historic
    WHERE Logical_Delete = 0;
END