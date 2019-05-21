CREATE PROCEDURE `SP_CREATE_PAYMENT_METHOD`
(
    _name VARCHAR(100)
)

BEGIN

INSERT INTO Payment_Methods
(
    name
)
VALUES
(
    _name
);

END