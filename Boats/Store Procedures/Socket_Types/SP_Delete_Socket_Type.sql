/* SP SP_DELETE_SOCKET_TYPE: Elimina un so.ket */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_SOCKET_TYPE`(_socket_type_id INT)
BEGIN
     UPDATE socket_types SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        socket_type_id = _socket_type_id;
END