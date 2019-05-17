/* SP SP_READ_NOTIFICATIONS: Trae las notificaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_NOTIFICATIONS`()
BEGIN
    SELECT * FROM notifications WHERE logical_deleted = 0;
END