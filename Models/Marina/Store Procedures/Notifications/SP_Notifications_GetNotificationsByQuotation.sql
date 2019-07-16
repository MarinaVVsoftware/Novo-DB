/* SP SP_Notifications_GetNotificationsByQuotation: Trae las notificaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Notifications_GetNotificationsByQuotation`(
    _marina_quotation_id INT
)
BEGIN
    /* verifica que exista la cotización. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotations 
        WHERE marina_quotation_id = _marina_quotation_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Quotation was not found. Can't get notifications without a marina quotation id valid.";
    END IF;

    SELECT
        notification_id AS notificationId,
        client_id AS clientId,
        notification_type_id AS notificationTypeId,
        notification_status_id AS notificationStatusId,
        marina_quotation_id AS marinaQuotationId,
        title,
        message,
        creation_responsable AS creationResponsable,
        date_to_send AS dateToSend
    FROM notifications 
    WHERE marina_quotation_id = _marina_quotation_id
    AND logical_deleted = 0;
END