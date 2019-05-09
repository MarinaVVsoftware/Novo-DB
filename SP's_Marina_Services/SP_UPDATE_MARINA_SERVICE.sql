CREATE PROCEDURE `SP_UPDATE_MARINA_SERVICE`
(
    _marina_service_id INT,
    _name VARCHAR(100),
    _price FLOAT(16,8)
)

BEGIN

UPDATE Marina_Services SET  
    name = _name,
    price = _price
WHERE 
    marina_service_id = _marina_service_id;

END