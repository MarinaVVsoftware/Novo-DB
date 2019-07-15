/* SP SP_Notifications_PatchNotification: Actualiza una notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Notifications_PatchNotification`(
    _notification_id INT,
    _title VARCHAR(200),
    _message VARCHAR(500),
    _date_to_send DATETIME
)
BEGIN
    /* verifica que exista la notificación. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM notifications 
        WHERE notification_id = _notification_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Notification was not found. Can't patch notification without an id valid.";
    END IF;

    UPDATE notifications SET
        title = _title,
        message = _message,
        date_to_send = _date_to_send
    WHERE 
        notification_id = _notification_id;
END