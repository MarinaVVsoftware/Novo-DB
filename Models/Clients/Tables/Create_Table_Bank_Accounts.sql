/* Table "Bank Accounts"
Almacena la información de las cuentas bancarias de los clientes.

bank_account_id     -> ID natural
status_id           -> FK con el status del cliente
alias               -> Alias
bank                -> Banco
account_number      -> Número de cuenta
clabe               -> clave interbancaria
logic_deleted       -> Borrado lógico
logic_deleted_date  -> Fecha de borrado lógico

PK = bank_account_id 
*/
 CREATE TABLE IF NOT EXISTS bank_accounts (
	bank_account_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    alias VARCHAR(50) NOT NULL,
    bank VARCHAR(100) NOT NULL,
    account_number VARCHAR(50) NOT NULL,
    clabe VARCHAR(50) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (bank_account_id)
);