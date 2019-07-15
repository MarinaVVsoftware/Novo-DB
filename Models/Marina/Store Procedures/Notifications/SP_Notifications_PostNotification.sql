/* SP SP_Notifications_PostNotification: Crea una notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Notifications_PostNotification`(
    _client_id INT,
    _notification_type_id INT,
    _notification_status_id INT,
    _marina_quotation_id INT,
    _title VARCHAR(200),
    _message VARCHAR(500),
    _creation_responsable VARCHAR(100),
    _date_to_send DATETIME
)
BEGIN
    /* verifica que exista el notification status. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM notification_status 
        WHERE notification_status_id = _notification_status_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Notification status was not found. Can't post notification without a notification status valid.";
    END IF;

    /* verifica que exista el notification type. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM notification_types
        WHERE notification_status_id = _notification_status_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Notification type was not found. Can't post notification without a notification type valid.";
    END IF;

    INSERT INTO notifications(
        client_id,
        notification_type_id,
        notification_status_id,
        marina_quotation_id,
        title,
        message,
        creation_responsable,
        date_to_send
    )
    VALUES(
        _client_id,
        _notification_type_id,
        _notification_status_id,
        _marina_quotation_id,
        _title,
        _message,
        _creation_responsable,
        _date_to_send
    );
END