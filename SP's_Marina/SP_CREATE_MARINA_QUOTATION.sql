CREATE PROCEDURE `SP_CREATE_MARINA_QUOTATION`
(
    _boat_id INT,
    _marina_quotation_status_id INT,
    _marina_mooring_rate_id INT,
    _arrival_date DATE,
    _departure_date DATE,
    _arrival_status BOOLEAN,
    _days_stay INT, 
    _discount_stay FLOAT(16,8),
    _tax FLOAT(16,8),
    _total FLOAT(16,8), 
    _subtotal FLOAT(16,8)
)

BEGIN

INSERT INTO Marina_Quotations 
(
    boat_id, 
    marina_quotation_status_id, 
    marina_mooring_rate_id,
    arrival_date,
    departure_date,
    arrival_status,
    days_stay,
    discount_stay,
    tax,
    total,
    subtotal
)
VALUES
(
    _boat_id,
    _marina_quotation_status_id,
    _marina_mooring_rate_id,
    _arrival_date,
    _departure_date,
    _arrival_status,
    _days_stay, 
    _discount_stay,
    _tax,
    _total, 
    _subtotal
);

END