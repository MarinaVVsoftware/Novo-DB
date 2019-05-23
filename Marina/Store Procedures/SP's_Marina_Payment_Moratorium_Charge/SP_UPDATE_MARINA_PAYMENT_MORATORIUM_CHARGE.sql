CREATE PROCEDURE `SP_UPDATE_MARINA_PAYMENT_MORATORIUM_CHARGE`
(
    _marina_payment_moratorium_charge_id INT,
    _marina_moratorium_charge_id INT,
    _marina_payment_id INT,
    _marina_quotation_id INT,
    _client_id INT
)
BEGIN

UPDATE Marina_Payment_Moratorium_Charge SET  
    marina_moratorium_charge_id = _marina_moratorium_charge_id,
    marina_payment_id = _marina_payment_id,
    marina_quotation_id = _marina_quotation_id,
    client_id = _client_id
    
WHERE marina_payment_moratorium_charge_id = _marina_payment_moratorium_charge_id;

END