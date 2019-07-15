/* SP SP_Notifications_CreateNotification: Crea una notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Notifications_CreateNotification`(
    _client_id INT,
    _notification_type_id INT,
    _notification_status_id INT,
    _marina_quotation_id INT,
    _marina_quotation_services_id INT,
    _title VARCHAR(200),
    _message VARCHAR(500),
    _creation_responsable VARCHAR(100),
    _date_to_send DATETIME
)
BEGIN
    INSERT INTO notifications(
        client_id,
        notification_type_id,
        notification_status_id,
        marina_quotation_id,
        marina_quotation_services_id,
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
        _marina_quotation_services_id,
        _title,
        _message,
        _creation_responsable,
        _date_to_send
    );
END