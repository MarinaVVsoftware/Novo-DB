CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_MARINA_QUOTATION_DEBT`
(
    _marina_quotation_debt_id INT,
    _marina_quotation_id INT,
    _creation_date DATETIME,
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4),
    _subtotal DECIMAL(12,4),
    _paid BOOLEAN,
)
BEGIN

UPDATE Marina_Quotation_Debts SET  
    marina_quotation_id = _marina_quotation_id,
    creation_date = _creation_date,
    tax = _tax,
    total = _total,
    subtotal = _subtotal,
    paid = _paid
    
WHERE marina_quotation_debt_id = _marina_quotation_debt_id;

END