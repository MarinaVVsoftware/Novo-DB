/* SP SP_SocketTypes_PostSocketType: Crea un tipo de socket eléctrico para barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SocketTypes_PostSocketType`(
    _socket_type VARCHAR(100),
    _description VARCHAR(200)
)
BEGIN
    INSERT INTO socket_types (
        socket_type, 
        description
    )
    VALUES (
        _socket_type, 
        _description
    );
END