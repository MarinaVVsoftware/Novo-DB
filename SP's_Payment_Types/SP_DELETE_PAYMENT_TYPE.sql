CREATE PROCEDURE `SP_DELETE_PAYMENT_TYPE` ( _payment_type_id INT )

BEGIN

DELETE FROM Payment_Types WHERE payment_type_id = _payment_type_id;

END