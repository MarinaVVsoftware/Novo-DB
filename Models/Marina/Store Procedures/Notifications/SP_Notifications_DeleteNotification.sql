/* SP SP_Notifications_DeleteNotification: Elimina una notificación */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Notifications_DeleteNotification`(
    _notification_id INT
)
BEGIN
     UPDATE notifications SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        notification_id = _notification_id;
END