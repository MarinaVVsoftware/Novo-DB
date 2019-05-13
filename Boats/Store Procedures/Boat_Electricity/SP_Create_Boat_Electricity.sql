/* SP SP_CREATE_BOAT_ELECTRICITY: Crea una relación de configuración eléctrica con un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_BOAT_ELECTRICITY`(
    _boat_id INT,
    _cable_type_id INT,
    _socket_type_id INT
)
BEGIN
    INSERT INTO boat_electricity(boat_id, cable_type_id, socket_type_id)
    VALUES(_boat_id, _cable_type_id, _socket_type_id);
END