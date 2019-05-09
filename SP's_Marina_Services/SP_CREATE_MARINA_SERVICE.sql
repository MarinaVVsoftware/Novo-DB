CREATE PROCEDURE `SP_CREATE_MARINA_SERVICE`
(
    _name VARCHAR(100),
    _price FLOAT(16,8)
)

BEGIN

INSERT INTO Marina_Services
(
    name,
    price
)
VALUES
(
    _name,
    _price
);

END