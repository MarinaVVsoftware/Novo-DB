CREATE PROCEDURE `SP_CREATE_MARINA_PAYMENT`
(
    _payment_type_id INT,
    _client_id INT,
    _folio INT,
    _currency VARCHAR(10),
    _currency_date DATETIME,
    _payment_received FLOAT(16,8),
    _converted_amount FLOAT(16,8),
    _creation_date DATETIME
)

BEGIN

INSERT INTO  Marina_Payments
(
    payment_type_id,
    client_id,
    folio,
    currency,
    currency_date,
    payment_received,
    converted_amount,
    creation_date
)
VALUES
(
    _payment_type_id,
    _client_id,
    _folio,
    _currency,
    _currency_date,
    _payment_received,
    _converted_amount,
    _creation_date
);

END