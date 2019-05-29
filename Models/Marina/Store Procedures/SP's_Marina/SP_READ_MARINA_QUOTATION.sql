CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_MARINA_QUOTATION`()

BEGIN

SELECT * FROM Marina_Quotations WHERE logical_deleted != 1;

END