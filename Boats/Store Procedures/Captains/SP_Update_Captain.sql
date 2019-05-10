/* SP SP_UPDATE_CAPTAIN: Actualiza un capitan. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_CAPTAIN`(
    _captain_id INT,
    _boat_id INT,
    _name varchar(50),
    _phone VARCHAR(15),
    _email VARCHAR(50),
    _payment_permission BOOLEAN,
    _aceptation_permission BOOLEAN
)
BEGIN
    UPDATE captains SET
        boat_id = _boat_id,
        name = _name,
        phone = _phone,
        email = _email,
        payment_permission = _payment_permission,
        aceptation_permission = _aceptation_permission
    WHERE 
        captain_id = _captain_id;
END