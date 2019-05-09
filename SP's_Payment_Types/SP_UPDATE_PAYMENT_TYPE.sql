CREATE PROCEDURE `SP_UPDATE_PAYMENT_TYPE`
(
    _payment_type_id INT,
    _name VARCHAR(100)
)
BEGIN

UPDATE Payment_Types SET  
    name = _name
    
WHERE payment_type_id = _payment_type_id;

END