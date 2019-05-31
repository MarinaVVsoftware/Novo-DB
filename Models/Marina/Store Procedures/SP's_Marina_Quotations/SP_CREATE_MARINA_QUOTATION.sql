CREATE DEFINER=`root`@`localhost` PROCEDURE  `SP_CREATE_MARINA_QUOTATION`
(
    _boat_id INT,
    _marina_quotation_status_id INT,
    _marina_mooring_tariff_id INT,
    _marina_quotation_electricity_id INT, 
    _arrival_date DATETIME,
    _departure_date DATETIME,
    _arrival_status BOOLEAN,
    _mooring_tariff DECIMAL(12,4),
    _loa DECIMAL(12,4),
    _days_stay INT, 
    _discount_stay_percentage DECIMAL(12,4),
    _currency_amount DECIMAL(12,4),
    _tax DECIMAL(12,4),
    _subtotal DECIMAL(12,4),
    _total DECIMAL(12,4),
    _monthly_quotation BOOLEAN,
    _annual_quotation BOOLEAN,
    _semiannual_quotation BOOLEAN, 
    _creation_responsable VARCHAR(100)
)

BEGIN

INSERT INTO Marina_Quotations 
(
    boat_id,
    marina_quotation_status_id,
    marina_mooring_tariff_id,
    marina_quotation_electricity_id, 
    arrival_date,
    departure_date,
    arrival_status,
    mooring_tariff,
    loa,
    days_stay, 
    discount_stay_percentage,
    currency_amount,
    tax,
    subtotal,
    total,
    monthly_quotation,
    annual_quotation,
    semiannual_quotation, 
    creation_responsable
)
VALUES
(
    _boat_id,
    _marina_quotation_status_id,
    _marina_mooring_tariff_id,
    _marina_quotation_electricity_id, 
    _arrival_date,
    _departure_date,
    _arrival_status,
    _mooring_tariff,
    _loa,
    _days_stay, 
    _discount_stay_percentage,
    _currency_amount,
    _tax,
    _subtotal,
    _total,
    _monthly_quotation,
    _annual_quotation,
    _semiannual_quotation, 
    _creation_responsable
);

END