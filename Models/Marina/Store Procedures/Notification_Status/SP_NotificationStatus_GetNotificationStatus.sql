/* SP SP_NotificationStatus_GetNotificationStatus: Trae los tipos de estados de notificaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NotificationStatus_GetNotificationStatus`()
BEGIN
    SELECT
        notification_status_id AS notificationStatusId,
        notification_status AS notificationStatus
    FROM notification_status 
    WHERE logical_deleted = 0
    ORDER BY notification_status_id ASC;
END