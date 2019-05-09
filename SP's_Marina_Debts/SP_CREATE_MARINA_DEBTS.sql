CREATE PROCEDURE `SP_CREATE_MARINA_DEBTS`
(
    _client_id INT,
    _folio INT,
    _amount FLOAT(16,8),
    _creation_date DATE
)

BEGIN

INSERT INTO Marina_Debts
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