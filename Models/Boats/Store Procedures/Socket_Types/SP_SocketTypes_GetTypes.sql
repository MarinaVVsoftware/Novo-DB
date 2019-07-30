/* SP SP_SocketTypes_GetTypes: Trae los tipos de sockets. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SocketTypes_GetTypes`()
BEGIN
    SELECT
        socket_type_id AS socketTypeId,
        socket_type AS socketType,
        description
    FROM socket_types 
    WHERE logical_deleted = 0
    ORDER BY socket_type_id ASC;
END