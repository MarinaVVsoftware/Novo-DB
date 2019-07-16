/* SP SP_Notifications_GetNotifications: Trae las notificaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Notifications_GetNotifications`()
BEGIN
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
    WHERE logical_deleted = 0;
END