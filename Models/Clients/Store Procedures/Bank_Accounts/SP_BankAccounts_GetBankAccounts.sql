/* SP SP_BankAccounts_GetBankAccounts: Trae la lista de cuentas bancarias de un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BankAccounts_GetBankAccounts`(
    _client_id INT
)
BEGIN
    SELECT 
       	bank_account_id AS bankAccountId,
        client_id AS clientId,
        account_number AS accountNumber,
        alias,
        bank,
        clabe
    FROM bank_accounts 
    WHERE client_id = _client_id
    AND logical_deleted = 0;
END