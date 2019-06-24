CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_MARINA_QUOTATION_SERVICE`()

BEGIN

SELECT * FROM Marina_Quotation_Services WHERE logical_deleted != 1;

END