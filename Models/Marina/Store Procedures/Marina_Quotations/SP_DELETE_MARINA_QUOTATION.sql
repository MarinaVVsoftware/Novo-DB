CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_MARINA_QUOTATION` ( _marina_quotation_id INT )

BEGIN

DELETE FROM Marina_Quotations WHERE marina_quotation_id = _marina_quotation_id;

END