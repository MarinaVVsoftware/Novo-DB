CREATE PROCEDURE `SP_UPDATE_MARINA_DEBTS`
(
    _marina_debt_id INT,
    _client_id INT,
    _folio INT,
    _amount DECIMAL(12,4),
    _creation_date DATETIME
)
BEGIN

UPDATE Marina_Debts SET  
    client_id = _client_id,
    folio = _folio,
    amount = _amount,
    creation_date = _creation_date
    
WHERE marina_debt_id = _marina_debt_id;

END