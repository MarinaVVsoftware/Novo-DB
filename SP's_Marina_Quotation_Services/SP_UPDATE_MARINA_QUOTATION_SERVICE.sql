CREATE PROCEDURE `SP_UPDATE_MARINA_QUOTATION_SERVICE`
(
    _marina_quotation_service_id INT,
    _boat_id INT,
    _marina_service_id INT,
    _done BOOLEAN,
    _tax FLOAT(16,8),
    _total FLOAT(16,8),
    _subtotal FLOAT(16,8),
    _quantity SMALLINT,
    _creation_date DATE
)

BEGIN

UPDATE Marina_Quotation_Services SET
    boat_id = _boat_id,
    marina_service_id = _marina_service_id,
    done = _done,
    tax = _tax,
    total = _total,
    subtotal = _subtotal,
    quantity = _quantity,
    creation_date = _creation_date
WHERE marina_quotation_service_id = _marina_quotation_service_id;

END