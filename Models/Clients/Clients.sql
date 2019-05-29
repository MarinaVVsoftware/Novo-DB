/*CREACION DE TABLA CLIENT*/
CREATE TABLE
IF NOT EXISTS Clients
(
client_id INT AUTO_INCREMENT PRIMARY KEY,
rol_id INT,
status_id INT,
electronic_signature_id INT,
name VARCHAR
(55) ,
email VARCHAR
(55),
phone VARCHAR
(55),
address VARCHAR
(100),
creation_date DATETIME,
electronic_wallet_id INT
);

/*CREACION TABLE BANK ACCOUNT*/
CREATE TABLE
IF NOT EXISTS Bank_Account
(
bank_account_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
alias VARCHAR
(50),
bank VARCHAR
(50),
account_number VARCHAR
(50),
clabe VARCHAR
(50)
);

/*CREACION TABLA SOCIAL REASON*/
CREATE TABLE
IF NOT EXISTS Social_Reason
(
social_reason_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
emails VARCHAR
(200),
social_reason VARCHAR
(100),
RFC VARCHAR
(50),
CFDI VARCHAR
(50),
address VARCHAR
(50)
);

/*CREACION TABLA MARINA DEBTS*/
CREATE TABLE
IF NOT EXISTS Marina_Debts
(
marina_debt_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
folio INT,
amount DOUBLE,
creation_date DATETIME
);

/*CREACION DE TABLA MARINA PENDING PAYMENTS*/
CREATE TABLE
IF NOT EXISTS Marina_Pending_Payments
(
marina_pending_payments_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
folio INT,
amount DOUBLE,
creation_date DATETIME
);

/*CREACION DE TABLA MARINA PENDINGS RELATIONS*/
CREATE TABLE
IF NOT EXISTS Marina_Pendings_Relations
(
marina_peding_relation_id INT  AUTO_INCREMENT PRIMARY KEY,
marina_payment_id INT,
marina_debt_id INT,
marina_pending_payment_id INT
);

/*CREACION DE TABLA MARINA PAYMENTS*/
CREATE TABLE
IF NOT EXISTS Marina_Payments
(
marina_payment_id INT AUTO_INCREMENT PRIMARY KEY,
payment_type_id INT,
client_id INT,
folio INT,
currency VARCHAR
(50),
currency_date DATETIME,
payment_received DOUBLE,
converted_amount DOUBLE,
creation_date DATETIME
);

/*CREACION DE TABLA PYMENT_TYPE*/
CREATE TABLE
IF NOT EXISTS Payment_Types
(
payment_type_id INT AUTO_INCREMENT PRIMARY KEY,
payment_type VARCHAR
(50)
);

/*CREACION DE TABLA MARINA PAYMENT RELATION*/
CREATE TABLE
IF NOT EXISTS Marina_Payment_Relations
(
marina_payment_relation_id INT PRIMARY KEY AUTO_INCREMENT,
marina_quatation_id INT,
marina_payment_id INT,
marina_quotation_services_id INT
);

/*CREACION DE TABLA ELECTRIC WALLET*/
CREATE TABLE
IF NOT EXISTS Electronic_Wallet
(
electronic_wallet_id INT AUTO_INCREMENT PRIMARY KEY,
marina_amount DOUBLE
);

/*CREACION DE TABLA ELECTRONIC_WALLET_HISTORIC*/
CREATE TABLE
IF NOT EXISTS Electronic_Wallet_Historic
(
electronic_wallet_historic_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
creation_date DATETIME,
alter_resposable VARCHAR
(55),
description VARCHAR
(55),
previous_amount DOUBLE,
new_amount DOUBLE
);

/*CREACION DE TABLA CLIENT*/
CREATE TABLE
IF NOT EXISTS Clients
(
client_id INT AUTO_INCREMENT PRIMARY KEY,
status_id INT,
electronic_signature_id INT,
name VARCHAR
(55) ,
email VARCHAR
(55),
phone VARCHAR
(55),
address VARCHAR
(100),
creation_date DATE,
electronic_wallet_id INT
);

/*CREACION TABLE BANK ACCOUNT*/
CREATE TABLE
IF NOT EXISTS Bank_Account
(
bank_account_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
alias VARCHAR
(50),
bank VARCHAR
(50),
account_number VARCHAR
(50),
clabe VARCHAR
(50)
);

/*CREACION TABLA SOCIAL REASON*/
CREATE TABLE
IF NOT EXISTS Social_Reason
(
social_reason_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
emails VARCHAR
(200),
social_reason VARCHAR
(100),
RFC VARCHAR
(50),
CFDI VARCHAR
(50),
address VARCHAR
(50)
);

/*CREACION TABLA MARINA DEBTS*/
CREATE TABLE
IF NOT EXISTS Marina_Debts
(
marina_debt_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
folio INT,
amount DOUBLE,
creation_date DATETIME
);

/*CREACION DE TABLA MARINA PENDING PAYMENTS*/
CREATE TABLE
IF NOT EXISTS Marina_Pending_Payments
(
marina_pending_payments_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
folio INT,
amount DOUBLE,
creation_date DATETIME
);

/*CREACION DE TABLA MARINA PENDINGS RELATIONS*/
CREATE TABLE
IF NOT EXISTS Marina_Pendings_Relations
(
marina_peding_relation_id INT  AUTO_INCREMENT PRIMARY KEY,
marina_payment_id INT,
marina_debt_id INT,
marina_pending_payment_id INT
);

/*CREACION DE TABLA MARINA PAYMENTS*/
CREATE TABLE
IF NOT EXISTS Marina_Payments
(
marina_payment_id INT AUTO_INCREMENT PRIMARY KEY,
payment_type_id INT,
client_id INT,
folio INT,
currency VARCHAR
(50),
currency_date DATETIME,
payment_received DOUBLE,
converted_amount DOUBLE,
creation_date DATETIME
);

/*CREACION DE TABLA PYMENT_TYPE*/
CREATE TABLE
IF NOT EXISTS Payment_Types
(
payment_type_id INT AUTO_INCREMENT PRIMARY KEY,
payment_type VARCHAR
(50)
);

/*CREACION DE TABLA MARINA PAYMENT RELATION*/
CREATE TABLE
IF NOT EXISTS Marina_Payment_Relations
(
marina_payment_relation_id INT PRIMARY KEY AUTO_INCREMENT,
marina_quatation_id INT,
marina_payment_id INT,
marina_quotation_services_id INT
);

/*CREACION DE TABLA ELECTRIC WALLET*/
CREATE TABLE
IF NOT EXISTS Electronic_Wallet
(
electronic_wallet_id INT AUTO_INCREMENT PRIMARY KEY,
marina_amount DOUBLE
);

/*CREACION DE TABLA ELECTRONIC_WALLET_HISTORIC*/
CREATE TABLE
IF NOT EXISTS Electronic_Wallet_Historic
(
electronic_wallet_historic_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
creation_date DATETIME,
alter_resposable VARCHAR
(55),
description VARCHAR
(55),
previous_amount DOUBLE,
new_amount DOUBLE
);

