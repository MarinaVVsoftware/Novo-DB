/* SP SP_UPDATE_BOAT_ELECTRICITY: Actualiza una relación de configuración eléctrica. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_BOAT_ELECTRICITY`(
    _boat_electricity_id INT,
    _boat_id INT,
    _cable_type_id INT,
    _socket_type_id INT
)
BEGIN
    UPDATE boat_electricity SET
        cable_type_id = _cable_type_id,
        socket_type_id = _socket_type_id
    WHERE 
        boat_electricity_id = _boat_electricity_id;
END