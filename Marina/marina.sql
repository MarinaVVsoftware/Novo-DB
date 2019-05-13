use novodb;

/* CREATE TABLE Marina_Quotation */
CREATE TABLE IF NOT EXISTS Marina_Quotations (
    marina_quotation_id INT AUTO_INCREMENT PRIMARY KEY,
    boat_id INT NOT NULL,
    marina_quotation_status_id INT NOT NULL,
    marina_mooring_rate_id INT NOT NULL,
    arrival_date DATETIME,
    departure_date DATETIME,
    arrival_status BOOLEAN, 
    days_stay INT, 
    discount_stay DECIMAL(12,4),
    tax DECIMAL(12,4),
    total DECIMAL(12,4), 
    subtotal DECIMAL(12,4),
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME
);

/* CREATE TABLE Marina_Quotation_Status */
CREATE TABLE IF NOT EXISTS Marina_Quotation_Status (
    marina_quotation_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50)
);

/* CREATE TABLE Marina_Mooring_Rates */
CREATE TABLE IF NOT EXISTS Marina_Mooring_Rates (
    marina_mooring_rate_id INT AUTO_INCREMENT PRIMARY KEY,
    marina_mooring_rate_type_id INT NOT NULL,
    name VARCHAR(100),
    description VARCHAR(300),
    ft_min SMALLINT,
    ft_max SMALLINT,
    price DECIMAL(12,4),
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME
);

/* CREATE TABLE Marina_Mooring_Rates_Types */
CREATE TABLE IF NOT EXISTS Marina_Mooring_Rates_Types (
    marina_mooring_rate_type_id INT AUTO_INCREMENT PRIMARY KEY, 
    type VARCHAR(100)
);

/* CREATE TABLE Marina_Quotation_Services */
CREATE TABLE IF NOT EXISTS Marina_Quotation_Services (
    marina_quotation_service_id INT AUTO_INCREMENT PRIMARY KEY,
    boat_id INT NOT NULL,
    marina_service_id INT NOT NULL,
    done BOOLEAN,
    tax DECIMAL(12,4),
    total DECIMAL(12,4),
    subtotal DECIMAL(12,4),
    quantity SMALLINT,
    creation_date DATETIME,
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME
);

/* CREATE TABLE Marina_Services */
CREATE TABLE IF NOT EXISTS Marina_Services (
    marina_service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(12,4)
);

/* CREATE TABLE Marina_Payments_Relations */
CREATE TABLE IF NOT EXISTS Marina_Payments_Relations (
    marina_payment_relation_id INT AUTO_INCREMENT PRIMARY KEY,
    marina_quotation_id INT NOT NULL,
    marina_payment_id INT NOT NULL,
    marina_quotation_services_id INT NOT NULL
);

/* CREATE TABLE Marina_Payments */
CREATE TABLE IF NOT EXISTS Marina_Payments (
    marina_payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_type_id INT NOT NULL,
    client_id INT NOT NULL,
    folio INT,
    currency VARCHAR(10),
    currency_date DATETIME,
    payment_received DECIMAL(12,4),
    converted_amount DECIMAL(12,4),
    creation_date DATETIME
);

/* CREATE TABLE Payment_Types */
CREATE TABLE IF NOT EXISTS Payment_Types (
    payment_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

/* CREATE TABLE Marina_Pending_Payments_Relations */
CREATE TABLE IF NOT EXISTS Marina_Pending_Payments_Relations (
    marina_pending_payment_relation_id INT AUTO_INCREMENT PRIMARY KEY,
    marina_payment_id INT NOT NULL,
    marina_debt_id INT NOT NULL,
    marina_pending_payment_id INT NOT NULL
);

/* CREATE TABLE Marina_Pending_Payments */
CREATE TABLE IF NOT EXISTS Marina_Pending_Payments (
    marina_pending_payment_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    folio INT,
    amount DECIMAL(12,4),
    creation_date DATETIME
);

/* CREATE TABLE Marina_Debts */
CREATE TABLE IF NOT EXISTS Marina_Debts (
    marina_debt_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    folio INT,
    amount DECIMAL(12,4),
    creation_date DATETIME
);