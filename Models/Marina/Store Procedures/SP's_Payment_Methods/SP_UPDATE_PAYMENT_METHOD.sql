CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_PAYMENT_METHOD`
(
    _payment_method_id INT,
    _name VARCHAR(100)
)
BEGIN

UPDATE Payment_Methods SET  
    name = _name
    
WHERE payment_method_id = _payment_method_id;

END