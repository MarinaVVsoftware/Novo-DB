CREATE DEFINER
=`root`@`localhost` PROCEDURE `SP_READ_BANK_ACCOUNT`
()
BEGIN
    SELECT *
    FROM bank_account
    WHERE Logical_Delete = 0
;
END