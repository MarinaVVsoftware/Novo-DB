CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_MARINA_MORATORIUM_CHARGE`
(
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

INSERT INTO  Marina_Moratorium_Charge
(
    marina_quotation_id,
    debt_origin,
    moratorium_percentage,
    paid,
    tax,
    total,
    subtotal,
    creation_date,
    creation_responsable
)
VALUES
(
    _marina_quotation_id,
    _debt_origin,
    _moratorium_percentage,
    _paid,
    _tax,
    _total,
    _subtotal,
    _creation_date,
    _creation_responsable
);

END