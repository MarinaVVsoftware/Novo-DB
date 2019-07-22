/* SP SP_BankAccounts_DeleteBankAccount: Elimina una cuenta bancaria. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BankAccounts_DeleteBankAccount`(
    _client_id INT,
    _account_number VARCHAR(50)
)
BEGIN
    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM clients
        WHERE client_id = _client_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000";
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM bank_accounts 
        WHERE account_number = _account_number
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45001";
    END IF;

    /* verifica que exista la relación entre el cliente y la cuenta bancaria. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM bank_accounts
        WHERE client_id = _client_id
        AND account_number = _account_number
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45002";
    END IF;

    UPDATE bank_accounts SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE account_number = _account_number;
END