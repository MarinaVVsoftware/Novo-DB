CREATE PROCEDURE `SP_DELETE_MARINA_PAYMENTS_RELATION` ( _marina_payment_relation_id INT )

BEGIN

DELETE FROM Marina_Payments_Relations WHERE marina_payment_relation_id = _marina_payment_relation_id;

END