/* SP SP_CREATE_CAPTAIN: Crea un capitán. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_CAPTAIN`(
    _boat_id INT,
    _name varchar(100),
    _phone VARCHAR(15),
    _email VARCHAR(100),
    _payment_permission BOOLEAN,
    _aceptation_permission BOOLEAN
)
BEGIN
    INSERT INTO captains (
        boat_id, 
        name, 
        phone, 
        email, 
        payment_permission, 
        aceptation_permission
    )
    VALUES (
        _boat_id, 
        _name, _phone, 
        _email, 
        _payment_permission, 
        _aceptation_permission
    );
END