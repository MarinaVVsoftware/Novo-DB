/* SP SP_NotificationTypes_CreateNotificationType: Crea un tipo de notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NotificationTypes_CreateNotificationType`(
    _notification_type VARCHAR(100)
)
BEGIN
    INSERT INTO notification_types (notification_type)
    VALUES (_notification_type);
END