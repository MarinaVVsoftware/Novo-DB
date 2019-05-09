CREATE PROCEDURE `SP_UPDATE_MARINA_PAYMENT`
(
    _marina_payment_id INT,
	_payment_type_id INT,
    _client_id INT,
    _folio INT,
    _currency VARCHAR(10),
    _currency_date DATE,
    _payment_received FLOAT(16,8),
    _converted_amount FLOAT(16,8),
    _creation_date DATE
)
BEGIN

UPDATE Marina_Payments SET  
    payment_type_id = _payment_type_id,
    client_id = _client_id,
    folio = _folio,
    currency = _currency,
    currency_date = _currency_date,
    payment_received = _payment_received,
    converted_amount = _converted_amount,
    creation_date = _creation_date
    
WHERE marina_payment_id = _marina_payment_id;

END