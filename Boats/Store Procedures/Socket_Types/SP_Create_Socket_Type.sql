/* SP SP_CREATE_SOCKET_TYPE: Crea un tipo de socket eléctrico para barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_SOCKET_TYPE`(
    _socket_type VARCHAR(50),
    _description VARCHAR(200)
)
BEGIN
    INSERT INTO socket_types(socket_type, description)
    VALUES(_socket_type, _description);
END