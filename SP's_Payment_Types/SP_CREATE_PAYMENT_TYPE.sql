CREATE PROCEDURE `SP_CREATE_PAYMENT_TYPE`
(
    _name VARCHAR(100)
)

BEGIN

INSERT INTO Payment_Types
(
    name
)
VALUES
(
    _name
);

END