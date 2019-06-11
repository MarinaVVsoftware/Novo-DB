CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_MARINA_QUOTATION_GROUP`()
BEGIN
	SELECT group_quotation FROM marina_quotations WHERE monthly_quotation = 1 ORDER BY group_quotation DESC LIMIT 0, 1;
END