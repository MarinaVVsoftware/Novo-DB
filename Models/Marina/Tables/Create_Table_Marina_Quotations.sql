/* CREATE TABLE Marina_Quotation */
CREATE TABLE IF NOT EXISTS Marina_Quotations (
    marina_quotation_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    marina_quotation_status_id INT NOT NULL,
    marina_mooring_tariff_id INT NOT NULL,
    marina_quotation_electricity_id INT, 
    arrival_date DATETIME,
    departure_date DATETIME,
    arrival_status BOOLEAN,
    mooring_tariff DECIMAL(12,4),
    loa DECIMAL(12,4),
    days_stay INT, 
    discount_stay_percentage DECIMAL(12,4),
    currency_amount DECIMAL(12,4),
    tax DECIMAL(12,4),
    subtotal DECIMAL(12,4),
    total DECIMAL(12,4),
    monthly_quotation BOOLEAN,
    annual_quotation BOOLEAN,
    semiannual_quotation BOOLEAN,
    group_quotation VARCHAR(50), 
    creation_responsable VARCHAR(100),
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY(marina_quotation_id)
);