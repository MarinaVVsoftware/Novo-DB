CREATE PROCEDURE `SP_CREATE_MARINA_QUOTATION_SERVICE`
(
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

INSERT INTO Marina_Quotation_Services
(
    boat_id,
    marina_service_id,
    done,
    tax,
    total,
    subtotal,
    quantity,
    creation_date
)
VALUES
(
    _boat_id,
    _marina_service_id,
    _done,
    _tax,
    _total,
    _subtotal,
    _quantity,
    _creation_date
);

END