CREATE PROCEDURE `SP_CREATE_MARINA_PAYMENTS_RELATION`
(
    _marina_quotation_id INT,
    _marina_payment_id INT,
    _marina_quotation_services_id INT
)

BEGIN

INSERT INTO Marina_Payments_Relations
(
    marina_quotation_id,
    marina_payment_id,
    marina_quotation_services_id
)
VALUES
(
    marina_quotation_id = _marina_quotation_id,
    marina_payment_id = _marina_payment_id,
    marina_quotation_services_id = _marina_quotation_services_id
);

END