/* SP SP_UPDATE_NOTIFICATION: Actualiza una notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_NOTIFICATION`(
    _notification_id INT,
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
    UPDATE notifications SET
        notification_id = _notification_id,
        client_id = _client_id,
        notification_type_id = _notification_type_id,
        notification_status_id = _notification_status_id,
        marina_quotation_id = _marina_quotation_id,
        marina_quotation_services_id = _marina_quotation_services_id,
        title = _title,
        message = _message,
        creation_responsable = _creation_responsable,
        date_to_send = _date_to_send
    WHERE 
        notification_id = _notification_id;
END