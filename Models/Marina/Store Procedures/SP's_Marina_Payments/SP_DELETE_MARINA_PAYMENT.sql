CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_MARINA_PAYMENT` ( _marina_payment_id INT )

BEGIN

DELETE FROM Marina_Payments WHERE marina_payment_id = _marina_payment_id;

END