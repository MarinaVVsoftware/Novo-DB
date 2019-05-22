CREATE PROCEDURE `SP_CREATE_MARINA_PAYMENT_MORATORIUM_CHARGE`
(
    _marina_moratorium_charge_id INT,
    _marina_payment_id INT,
    _marina_quotation_id INT,
    _client_id INT
)

BEGIN

INSERT INTO  Marina_Payment_Moratorium_Charge
(
    marina_payment_id,
    marina_quotation_id,
    client_id
)
VALUES
(
    _marina_moratorium_charge_id,
    _marina_payment_id,
    _marina_quotation_id,
    _client_id
);

END