CREATE PROCEDURE `SP_UPDATE_MARINA_PENDING_PAYMENT_RELATION`
(
    _marina_pending_payment_relation_id INT,
    _marina_payment_id INT,
    _marina_debt_id INT,
    _marina_pending_payment_id INT
)
BEGIN

UPDATE Marina_Pending_Payments_Relations SET  
    marina_payment_id = _marina_payment_id,
    marina_debt_id = _marina_debt_id,
    marina_pending_payment_id = _marina_pending_payment_id
    
WHERE marina_pending_payment_relation_id = _marina_pending_payment_relation_id;

END