CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BANK_ACCOUNT`(
_bank_account_id INT
)
BEGIN
DELETE FROM bank_account WHERE bank_account_id = _bank_account_id;
END