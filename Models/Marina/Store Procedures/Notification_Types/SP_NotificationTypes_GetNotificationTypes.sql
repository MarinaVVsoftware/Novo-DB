/* SP SP_NotificationTypes_GetNotificationTypes: Trae los tipos de notificaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NotificationTypes_GetNotificationTypes`()
BEGIN
    SELECT
        notification_type_id AS notificationTypeId,
        notification_type AS notificationType
    FROM notification_types WHERE logical_deleted = 0
    ORDER BY notification_type_id ASC;
END