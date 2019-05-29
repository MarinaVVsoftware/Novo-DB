CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_MARINA_QUOTATION_DEBT` ( _marina_quotation_debt_id INT )

BEGIN

DELETE FROM  Marina_Quotation_Debts WHERE marina_quotation_debt_id = _marina_quotation_debt_id;

END