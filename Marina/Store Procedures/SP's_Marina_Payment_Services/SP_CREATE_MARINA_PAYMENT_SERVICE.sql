CREATE PROCEDURE `SP_CREATE_MARINA_PAYMENT`
(
    _marina_quotation_service_id INT,
    _payment_method_id INT,
    _client_id INT,
    _creation_date DATETIME,
    _creation_responsable VARCHAR(100),
    _client_responsable VARCHAR(100),
    _currency VARCHAR(10),
    _currency_date DATETIME,
    _payment_received DECIMAL(12,4),
    _converted_amount DECIMAL(12,4),
)

BEGIN

INSERT INTO  Marina_Payment_Services
(
    marina_quotation_service_id,
    payment_method_id,
    client_id,
    creation_date,
    creation_responsable,
    currency,
    currency_date,
    payment_received,
    converted_amount
)
VALUES
(
    _marina_quotation_service_id,
    _payment_method_id,
    _client_id,
    _creation_date,
    _creation_responsable,
    _currency,
    _currency_date,
    _payment_received,
    _converted_amount
);

END