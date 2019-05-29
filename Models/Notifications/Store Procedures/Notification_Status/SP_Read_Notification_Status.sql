/* SP SP_READ_NOTIFICATION_STATUS: Trae los tipos de estados de notificaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_NOTIFICATION_STATUS`()
BEGIN
    SELECT * FROM notification_status WHERE logical_deleted = 0;
END