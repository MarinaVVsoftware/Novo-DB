CREATE PROCEDURE `SP_CREATE_MARINA_PENDING_PAYMENT_RELATION`
(
    _marina_payment_id INT,
    _marina_debt_id INT,
    _marina_pending_payment_id INT
)

BEGIN

INSERT INTO Marina_Pending_Payments_Relations
(
    marina_payment_id,
    marina_debt_id,
    marina_pending_payment_id
)
VALUES
(
    _marina_payment_id,
    _marina_debt_id,
    _marina_pending_payment_id
);

END