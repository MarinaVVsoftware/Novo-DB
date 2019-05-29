/* SP SP_DELETE_SOCKET_TYPE: Elimina un so.ket */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_SOCKET_TYPE`(_socket_type_id INT)
BEGIN
    /* verifica que exista el socket. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM socket_type 
        WHERE socket_type_id = _socket_type_id 
        AND logical_deleted = 0)
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Socket_Type doesn't exist. Can't delete.";
    ELSE

    UPDATE socket_types SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        socket_type_id = _socket_type_id;
END