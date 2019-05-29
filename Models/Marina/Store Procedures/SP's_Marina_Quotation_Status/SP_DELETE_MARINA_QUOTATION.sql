CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_MARINA_QUOTATION_STATUS` ( _marina_quotation_status_id INT )

BEGIN

DELETE FROM Marina_Quotation_Status WHERE marina_quotation_status_id = _marina_quotation_status_id;

END