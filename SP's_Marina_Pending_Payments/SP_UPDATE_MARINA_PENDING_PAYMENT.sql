CREATE PROCEDURE `SP_UPDATE_MARINA_PENDING_PAYMENT`
(
    _marina_pending_payment_id INT,
    _client_id INT,
    _folio INT,
    _amount DECIMAL(12,4),
    _creation_date DATETIME
)
BEGIN

UPDATE Marina_Pending_Payments SET  
    client_id = _client_id,
    folio = _folio,
    amount = _amount,
    creation_date = _creation_date
    
WHERE marina_pending_payment_id = _marina_pending_payment_id;

END