CREATE PROCEDURE `SP_DELETE_MARINA_DEBTS` ( _marina_debt_id INT )

BEGIN

DELETE FROM Marina_Debts WHERE marina_debt_id = _marina_debt_id;

END