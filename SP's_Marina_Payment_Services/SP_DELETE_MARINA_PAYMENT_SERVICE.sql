CREATE PROCEDURE `SP_DELETE_MARINA_PAYMENT` ( _marina_payment_service_id INT )

BEGIN

DELETE FROM Marina_Payment_Services WHERE _marina_payment_service_id = _marina_payment_service_id;

END