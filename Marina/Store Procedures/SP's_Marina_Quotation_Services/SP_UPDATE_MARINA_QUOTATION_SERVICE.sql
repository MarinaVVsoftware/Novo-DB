CREATE PROCEDURE `SP_UPDATE_MARINA_QUOTATION_SERVICE`
(
    _marina_quotation_service_id INT,
    _boat_id INT,
    _marina_service_id INT,
    _done BOOLEAN,
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4),
    _subtotal DECIMAL(12,4),
    _quantity SMALLINT,
    _creation_date DATETIME
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