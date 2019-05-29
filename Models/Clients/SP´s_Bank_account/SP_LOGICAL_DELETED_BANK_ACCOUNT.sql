CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGICAL_DELETED_BANK_ACCOUNT`(
_bank_account_id INT
)
BEGIN
UPDATE bank_account SET status_id = 1 WHERE bank_account_id = _bank_account_id;
END