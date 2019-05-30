/* SP SP_UPDATE_RESPONSABLE: Actualiza un responsable de barco */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_RESPONSABLE`(
    _responsable_id INT,
    _boat_id INT,
    _name varchar(100),
    _phone VARCHAR(15),
    _email VARCHAR(100),
    _payment_permission BOOLEAN,
    _aceptation_permission BOOLEAN
)
BEGIN
    UPDATE responsible SET
        boat_id = _boat_id,
        name = _name,
        phone = _phone,
        email = _email,
        payment_permission = _payment_permission,
        aceptation_permission = _aceptation_permission
    WHERE responsable_id = _responsable_id;
END