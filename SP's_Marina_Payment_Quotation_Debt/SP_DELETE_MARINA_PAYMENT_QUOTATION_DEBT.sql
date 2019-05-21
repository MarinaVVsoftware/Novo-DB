CREATE PROCEDURE `SP_DELETE_MARINA_PAYMENT` ( _marina_payment_quotation_debt_id INT )

BEGIN

DELETE FROM Marina_Payment_Quotation_Debt WHERE marina_payment_quotation_debt_id = _marina_payment_quotation_debt_id;

END