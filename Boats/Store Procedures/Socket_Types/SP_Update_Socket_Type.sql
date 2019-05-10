/* SP SP_UPDATE_SOCKET_TYPE: Actualiza un socket. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SOCKET_TYPE`(
    _socket_type_id INT,
    _socket_type VARCHAR(100),
    _description VARCHAR(200)
)
BEGIN
    UPDATE socket_types SET
        socket_type = _socket_type,
        description = _description
    WHERE 
        socket_type_id = _socket_type_id;
END