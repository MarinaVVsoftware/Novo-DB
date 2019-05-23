CREATE PROCEDURE `SP_CREATE_MARINA_QUOTATION_DEBT`
(
    _marina_quotation_id INT,
    _creation_date DATETIME,
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4),
    _subtotal DECIMAL(12,4),
    _paid BOOLEAN,
)

BEGIN

INSERT INTO  Marina_Quotation_Debts
(
    marina_quotation_id,
    creation_date,
    tax,
    total,
    subtotal,
    paid
)
VALUES
(
    _marina_quotation_id,
    _creation_date,
    _tax,
    _total,
    _subtotal,
    _paid
);

END