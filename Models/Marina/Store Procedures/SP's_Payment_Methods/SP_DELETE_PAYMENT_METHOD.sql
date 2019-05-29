CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_PAYMENT_METHOD` ( _payment_method_id INT )

BEGIN

DELETE FROM Payment_Methods WHERE payment_method_id = _payment_method_id;

END