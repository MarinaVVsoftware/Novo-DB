CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_MARINA_PAYMENT_MORATORIUM_CHARGE` ( _marina_moratorium_charge_id INT )

BEGIN

DELETE FROM Marina_Payment_Moratorium_Charge WHERE marina_moratorium_charge_id = _marina_moratorium_charge_id;

END