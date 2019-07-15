/* SP SP_NotificationStatus_CreateNotificationStatus: Crea un tipo de estado de notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NotificationStatus_CreateNotificationStatus`(
    _notification_status VARCHAR(100)
)
BEGIN
    INSERT INTO notification_status(notification_status)
    VALUES(_notification_status);
END