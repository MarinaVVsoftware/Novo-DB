/* SP SP_READ_NOTIFICATION_TYPES: Trae los tipos de notificaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_NOTIFICATION_TYPES`()
BEGIN
    SELECT * FROM notification_types WHERE logical_deleted = 0;
END