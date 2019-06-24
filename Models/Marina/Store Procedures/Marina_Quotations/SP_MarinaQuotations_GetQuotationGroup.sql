CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotations_GetQuotationGroup`()
BEGIN
	SELECT group_quotation 
	FROM marina_quotations 
	WHERE monthly_quotation = 1 
	ORDER BY group_quotation
	DESC LIMIT 0, 1;
END