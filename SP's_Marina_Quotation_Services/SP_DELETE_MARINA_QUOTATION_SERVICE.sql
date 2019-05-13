CREATE PROCEDURE `SP_DELETE_MARINA_QUOTATION_SERVICE` ( _marina_quotation_service_id INT )

BEGIN

DELETE FROM Marina_Quotation_Services WHERE marina_quotation_service_id = _marina_quotation_service_id;

END