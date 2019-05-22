CREATE PROCEDURE `SP_UPDATE_MARINA_MORATORIUM_CHARGE`
(
    _marina_moratorium_charge_id INT,
    _marina_quotation_id INT,
    _debt_origin DECIMAL(12,4),
    _moratorium_percentage DECIMAL(12,4),
    _paid BOOLEAN,
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4),
    _subtotal DECIMAL(12,4),
    _creation_date DATETIME,
    _creation_responsable VARCHAR(100)
)
BEGIN

UPDATE Marina_Moratorium_Charge SET  
    marina_quotation_id = _marina_quotation_id,
    debt_origin = _debt_origin,
    moratorium_percentage = _moratorium_percentage,
    paid = _paid,
    tax = _tax,
    total = _total,
    subtotal = _subtotal,
    creation_date = _creation_date,
    creation_responsable = _creation_responsable
    
WHERE marina_moratorium_charge_id = _marina_moratorium_charge_id;

END