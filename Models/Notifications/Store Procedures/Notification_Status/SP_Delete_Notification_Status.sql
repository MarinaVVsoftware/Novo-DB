/* SP SP_DELETE_NOTIFICATION_STATUS: Elimina un tipo de estado de notificación */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_NOTIFICATION_STATUS`(_notification_status_id INT)
BEGIN
     UPDATE notification_status SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        notification_status_id = _notification_status_id;
END