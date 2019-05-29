CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_MARINA_QUOTATION`
(
	_marina_quotation_id INT,
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
    creation_responsable VARCHAR(100),
)
BEGIN

UPDATE Marina_Quotations SET  
    boat_id = _boat_id, 
    marina_quotation_status_id = _marina_quotation_status_id, 
    marina_mooring_rates_id =  _marina_mooring_rate_id,
    arrival_date = _arrival_date,
    departure_date = _departure_date,
    arrival_status = _arrival_status,
    days_stay = _days_stay,
    discount_stay = _discount_stay,
    tax = _tax,
    total = _total,
    subtotal = _subtotal,
    creation_responsable = _creation_responsable
    
WHERE marina_quotation_id = _marina_quotation_id;

END