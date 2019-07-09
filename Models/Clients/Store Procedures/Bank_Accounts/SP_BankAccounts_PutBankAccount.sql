/* SP SP_BankAccounts_PutBankAccount: Crea o Modifica una cuenta bancaria. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BankAccounts_PutBankAccount`(
    _client_id INT,
    _old_account_number VARCHAR(50),
    _account_number VARCHAR(50),
    _alias VARCHAR(20),
    _bank VARCHAR(50),
    _clabe VARCHAR(50)
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
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't put bank account without a client id valid.";
    END IF;

    IF EXISTS (
        SELECT 1 FROM bank_accounts 
        WHERE account_number = _old_account_number
    )
    THEN
        UPDATE bank_accounts SET
            alias = _alias,
            bank = _bank,
            account_number = _account_number,
            clabe = _clabe
        WHERE _account_number = _old_account_number
        AND logical_deleted = 0;
    ELSE
        INSERT INTO bank_accounts (
            client_id,
            account_number,
            alias,
            bank,
            clabe
        )
        VALUES (
            _client_id,
            _account_number,
            _alias,
            _bank,
            _clabe
        );
    END IF;
END