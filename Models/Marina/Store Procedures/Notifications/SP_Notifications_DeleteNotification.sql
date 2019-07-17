/* SP SP_Notifications_DeleteNotification: Elimina una notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Notifications_DeleteNotification`(
    _marina_quotation_id INT,
    _notification_id INT
)
BEGIN
    /* verifica que exista la notificación. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotations 
        WHERE marina_quotation_id = _marina_quotation_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Quotation was not found. Can't delete notification without a marina quotation id valid.";
    END IF;

    /* verifica que exista la notificación. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM notifications 
        WHERE notification_id = _notification_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Notification was not found. Can't delete notification without an id valid.";
    END IF;

    /* verifica que exista la notificación. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM notifications
        WHERE marina_quotation_id = _marina_quotation_id
        AND notification_id = _notification_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exists that marina quotation related with that notification.";
    END IF;

    UPDATE notifications SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        notification_id = _notification_id;
END