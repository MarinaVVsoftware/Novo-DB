CREATE PROCEDURE `SP_CREATE_MARINA_PENDING_PAYMENT`
(
    _client_id INT,
    _folio INT,
    _amount FLOAT(16,8),
    _creation_date DATETIME
)

BEGIN

INSERT INTO Marina_Pending_Payments
(
    client_id,
    folio,
    amount,
    creation_date
)
VALUES
(
    _client_id,
    _folio,
    _amount,
    _creation_date
);

END