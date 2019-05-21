CREATE PROCEDURE `SP_UPDATE_MARINA_PAYMENT`
(
    _marina_payment_service_id INT,
    _marina_quotation_service_id INT,
    _payment_method_id INT,
    _client_id INT,
    _creation_date DATETIME,
    _creation_responsable VARCHAR(100),
    _client_responsable VARCHAR(100),
    _currency VARCHAR(10),
    _currency_date DATETIME,
    _payment_received DECIMAL(12,4),
    _converted_amount DECIMAL(12,4),
)
BEGIN

UPDATE Marina_Payment_Services SET  
    marina_quotation_service_id,
    payment_method_id,
    client_id,
    creation_date,
    creation_responsable,
    currency,
    currency_date,
    payment_received,
    converted_amount
    
WHERE marina_payment_service_id = _marina_payment_service_id;

END