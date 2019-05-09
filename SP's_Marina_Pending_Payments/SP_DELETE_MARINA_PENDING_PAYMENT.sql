CREATE PROCEDURE `SP_DELETE_MARINA_PENDING_PAYMENT` ( _marina_pending_payment_id INT )

BEGIN

DELETE FROM Marina_Pending_Payments WHERE marina_pending_payment_id = _marina_pending_payment_id;

END