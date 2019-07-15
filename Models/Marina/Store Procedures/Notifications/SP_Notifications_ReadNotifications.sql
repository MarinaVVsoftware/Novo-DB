/* SP SP_Notifications_ReadNotifications: Trae las notificaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Notifications_ReadNotifications`()
BEGIN
    SELECT * FROM notifications 
    WHERE logical_deleted = 0;
END