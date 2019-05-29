/* SP SP_CREATE_NOTIFICATION_STATUS: Crea un tipo de estado de notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_NOTIFICATION_STATUS`(
    _notification_status VARCHAR(100)
)
BEGIN
    INSERT INTO notification_status(notification_status)
    VALUES(_notification_status);
END