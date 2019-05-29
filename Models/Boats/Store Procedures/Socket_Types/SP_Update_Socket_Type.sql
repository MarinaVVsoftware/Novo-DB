/* SP SP_UPDATE_SOCKET_TYPE: Actualiza un socket. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SOCKET_TYPE`(
    _socket_type_id INT,
    _socket_type VARCHAR(100),
    _description VARCHAR(200)
)
BEGIN
     /* verifica que exista el socket. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM socket_type 
        WHERE socket_type_id = _socket_type_id 
        AND logical_deleted = 0)
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Socket type doesn't exist. Can't update.";
    ELSE
        UPDATE socket_types SET
            socket_type = _socket_type,
            description = _description
        WHERE socket_type_id = _socket_type_id;
    END IF;
END