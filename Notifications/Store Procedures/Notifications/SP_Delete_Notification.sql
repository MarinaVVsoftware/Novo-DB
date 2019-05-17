/* SP SP_DELETE_NOTIFICATION: Elimina una notificación */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_NOTIFICATION`(_notification_id INT)
BEGIN
     UPDATE notifications SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        notification_id = _notification_id;
END