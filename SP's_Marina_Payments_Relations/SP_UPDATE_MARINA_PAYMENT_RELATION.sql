CREATE PROCEDURE `SP_UPDATE_MARINA_PAYMENTS_RELATION`
(
    _marina_payment_relation_id INT,
    _marina_quotation_id INT,
    _marina_payment_id INT,
    _marina_quotation_services_id INT
)

BEGIN

UPDATE Marina_Payments_Relations SET
    marina_quotation_id = _marina_quotation_id,
    marina_payment_id = _marina_payment_id,
    marina_quotation_services_id = _marina_quotation_services_id
WHERE marina_payment_relation_id = _marina_payment_relation_id;

END