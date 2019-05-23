CREATE DEFINER=`root`@`localhost` PROCEDURE  `SP_CREATE_MARINA_QUOTATION`
(
    _boat_id INT,
    _marina_quotation_status_id INT,
    _marina_mooring_rate_id INT,
    _arrival_date DATETIME,
    _departure_date DATETIME,
    _arrival_status BOOLEAN,
    _days_stay INT, 
    _discount_stay DECIMAL(12,4),
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4), 
    _subtotal DECIMAL(12,4),
    _creation_responsable VARCHAR(100)
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
    subtotal,
    creation_responsable,
    creation_date,
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
    _subtotal,
    _creation_responsable,
    NOW()
);

END