/* SP SP_READ_SOCKET_TYPES: Trae los tipos de sockets. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_SOCKET_TYPES`()
BEGIN
    SELECT
        socket_type_id,
        socket_type,
        description
    FROM socket_types WHERE logical_deleted = 0;
END