use novodb;

/* CREATE TABLE Marina_Quotation */
CREATE TABLE IF NOT EXISTS Marina_Quotations (
    marina_quotation_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    marina_quotation_status_id INT NOT NULL,
    marina_mooring_rate_id INT NOT NULL,
    marina_electricity_sales_id INT NOT NULL,
    arrival_date DATETIME,
    departure_date DATETIME,
    arrival_status BOOLEAN, 
    days_stay INT, 
    discount_stay DECIMAL(12,4),
    tax DECIMAL(12,4),
    total DECIMAL(12,4), 
    subtotal DECIMAL(12,4),
    creation_responsable VARCHAR(100),
    creation_date DATETIME,
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME,


    PRIMARY KEY(marina_quotation_id)
);

/* CREATE TABLE Marina_Quotation_Status */
CREATE TABLE IF NOT EXISTS Marina_Quotation_Status (
    marina_quotation_status_id INT NOT NULL AUTO_INCREMENT,
    status VARCHAR(50),
    
    PRIMARY KEY(marina_quotation_status_id)
);

/* CREATE TABLE Marina_Electricity_Sales */
CREATE TABLE IF NOT EXISTS Marina_Electricity_Sales (
    marina_electricity_sales_id INT NOT NULL AUTO_INCREMENT,
    total DECIMAL(12,4),
    start_date DATETIME,
    end_date DATETIME,

    PRIMARY KEY(marina_electricity_sales_id)
);

/* CREATE TABLE Marina_Mooring_Rates */
CREATE TABLE IF NOT EXISTS Marina_Mooring_Rates (
    marina_mooring_rate_id INT NOT NULL AUTO_INCREMENT,
    marina_mooring_rate_type_id INT NOT NULL,
    name VARCHAR(100),
    description VARCHAR(300),
    ft_min SMALLINT,
    ft_max SMALLINT,
    price DECIMAL(12,4),
    is_conditional BOOLEAN,
    creation_responsable VARCHAR(100),
    creation_date DATETIME,
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME,
    
    PRIMARY KEY(marina_mooring_rate_id)
);

/* CREATE TABLE Marina_Mooring_Rates_Types */
CREATE TABLE IF NOT EXISTS Marina_Mooring_Rates_Types (
    marina_mooring_rate_type_id INT NOT NULL AUTO_INCREMENT, 
    type VARCHAR(100),

    PRIMARY KEY(marina_mooring_rate_type_id)
);

/* CREATE TABLE Marina_Quotation_Services */
CREATE TABLE IF NOT EXISTS Marina_Quotation_Services (
    marina_quotation_service_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    marina_service_id INT NOT NULL,
    done BOOLEAN,
    tax DECIMAL(12,4),
    total DECIMAL(12,4),
    subtotal DECIMAL(12,4),
    quantity SMALLINT,
    creation_date DATETIME,
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME,

    PRIMARY KEY(marina_quotation_service_id)
);

CREATE TABLE IF NOT EXISTS Marina_Payment_Services (
    marina_payment_service_id INT NOT NULL AUTO_INCREMENT,
    marina_quotation_service_id INT NOT NULL,
    payment_method_id INT NOT NULL,
    client_id INT NOT NULL,
    creation_date DATETIME,
    creation_responsable VARCHAR(100),
    client_responsable VARCHAR(100),
    currency VARCHAR(10),
    currency_date DATETIME,
    payment_received DECIMAL(12,4),
    converted_amount DECIMAL(12,4),

    PRIMARY KEY(marina_payment_service_id)
);

/* CREATE TABLE Marina_Services */
CREATE TABLE IF NOT EXISTS Marina_Services (
    marina_service_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(12,4),

    PRIMARY KEY(marina_service_id)
);

/* CREATE TABLE Marina_Payments_Relations */
CREATE TABLE IF NOT EXISTS Marina_Payment_Quotation_Debt (
    marina_payment_quotation_debt_id INT NOT NULL PRIMARY KEY,
    marina_quotation_id INT NOT NULL,
    marina_payment_id INT NOT NULL,
    marina_quotation_debt_id INT NOT NULL,
    client_id INT NOT NULL,

    PRIMARY KEY(marina_payment_quotation_debt_id)
);

/* CREATE TABLE Marina_Payments */
CREATE TABLE IF NOT EXISTS Marina_Payments (
    marina_payment_id INT NOT NULL AUTO_INCREMENT,
    payment_method_id INT NOT NULL,
    currency VARCHAR(10),
    currency_date DATETIME,
    payment_received DECIMAL(12,4),
    converted_amount DECIMAL(12,4),
    creation_date DATETIME,
    client_responsable VARCHAR(100),
    creation_responsable VARCHAR(100),

    PRIMARY KEY(marina_payment_id)
);

/* CREATE TABLE Payment_Methods */
CREATE TABLE IF NOT EXISTS Payment_Methods (
    payment_method_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),

    PRIMARY KEY(payment_method_id)
);

/* COMPONER LOS STORES */
/* CREATE TABLE Marina_Pending_Payments_Relations */
CREATE TABLE IF NOT EXISTS Marina_Payment_Moratorium_Charge (
    marina_payment_moratorium_charge_id INT NOT NULL AUTO_INCREMENT,
    marina_moratorium_charge_id INT NOT NULL,
    marina_payment_id INT NOT NULL,
    marina_quotation_id INT NOT NULL,
    client_id INT NOT NULL,

    PRIMARY KEY(marina_payment_moratorium_charge_id)
);

/* CREATE TABLE Marina_Pending_Payments */
CREATE TABLE IF NOT EXISTS Marina_Moratorium_Charge (
    marina_moratorium_charge_id INT NOT NULL AUTO_INCREMENT,
    marina_quotation_id INT NOT NULL,
    debt_origin DECIMAL(12,4),
    moratorium_percentage DECIMAL(12,4),
    paid BOOLEAN,
    tax DECIMAL(12,4),
    total DECIMAL(12,4),
    subtotal DECIMAL(12,4),
    creation_date DATETIME,
    creation_responsable VARCHAR(100),

    PRIMARY KEY(marina_moratorium_charge_id)

);

/* CREATE TABLE Marina_Debts */
CREATE TABLE IF NOT EXISTS Marina_Quotation_Debts (
    marina_quotation_debt_id INT NOT NULL AUTO_INCREMENT,
    marina_quotation_id INT NOT NULL,
    creation_date DATETIME,
    tax DECIMAL(12,4),
    total DECIMAL(12,4),
    subtotal DECIMAL(12,4),
    paid BOOLEAN,

    PRIMARY KEY(marina_quotation_debt_id)
);


ALTER TABLE Marina_Quotations ADD FOREIGN KEY(boat_id) REFERENCES Boats(boat_id);
ALTER TABLE Marina_Quotations ADD FOREIGN KEY(marina_quotation_status_id) REFERENCES Marina_Quotation_Status(marina_quotation_status_id);
ALTER TABLE Marina_Quotations ADD FOREIGN KEY(marina_mooring_rate_id) REFERENCES Marina_Mooring_Rates(marina_mooring_rate_id);
ALTER TABLE Marina_Quotations ADD FOREIGN KEY(marina_electricity_sales_id) REFERENCES Marina_Electricity_Sales(marina_electricity_sales_id);

ALTER TABLE Marina_Mooring_Rates ADD FOREIGN KEY(marina_mooring_rate_type_id) REFERENCES Marina_Mooring_Rates_Types(marina_mooring_rate_type_id);

ALTER TABLE Marina_Quotation_Services ADD FOREIGN KEY(boat_id) REFERENCES Boats(boat_id);
ALTER TABLE Marina_Quotation_Services ADD FOREIGN KEY(marina_service_id) REFERENCES Marina_Services(marina_service_id);

ALTER TABLE Marina_Payment_Services ADD FOREIGN KEY(marina_quotation_service_id) REFERENCES Marina_Quotation_Services(marina_quotation_service_id);
ALTER TABLE Marina_Payment_Services ADD FOREIGN KEY(payment_method_id) REFERENCES Payment_Methods(payment_method_id);
ALTER TABLE Marina_Payment_Services ADD FOREIGN KEY(client_id) REFERENCES Clients(client_id);

ALTER TABLE Marina_Payment_Quotation_Debt ADD FOREIGN KEY(marina_quotation_id) REFERENCES Marina_Quotation(marina_quotation_id);
ALTER TABLE Marina_Payment_Quotation_Debt ADD FOREIGN KEY(marina_payment_id) REFERENCES Marina_Payments(marina_payment_id);
ALTER TABLE Marina_Payment_Quotation_Debt ADD FOREIGN KEY(marina_quotation_debt_id) REFERENCES Marina_Quotation_Debts(marina_quotation_debt_id);
ALTER TABLE Marina_Payment_Quotation_Debt ADD FOREIGN KEY(client_id) REFERENCES Clients(client_id);

ALTER TABLE Marina_Payments ADD FOREIGN KEY(payment_method_id) REFERENCES Payment_Methods(payment_method_id);

ALTER TABLE Marina_Payment_Moratorium_Charge ADD FOREIGN KEY(marina_moratorium_charge_id) REFERENCES Marina_Moratorium_Charge(marina_moratorium_charge_id);
ALTER TABLE Marina_Payment_Moratorium_Charge ADD FOREIGN KEY(marina_payment_id) REFERENCES Marina_Payments(marina_payment_id);
ALTER TABLE Marina_Payment_Moratorium_Charge ADD FOREIGN KEY(marina_quotation_id) REFERENCES Marina_Quotation(marina_quotation_id);
ALTER TABLE Marina_Payment_Moratorium_Charge ADD FOREIGN KEY(client_id) REFERENCES Clients(client_id);

ALTER TABLE Marina_Moratorium_Charge ADD FOREIGN KEY(marina_quotation_id) REFERENCES Marina_Quotation(marina_quotation_id);

ALTER TABLE Marina_Quotation_Debts ADD FOREIGN KEY(marina_quotation_id) REFERENCES Marina_Quotation(marina_quotation_id);