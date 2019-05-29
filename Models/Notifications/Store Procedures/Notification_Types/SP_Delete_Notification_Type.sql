/* SP SP_DELETE_NOTIFICATION_TYPE: Elimina un tipo de notificación */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_NOTIFICATION_TYPE`(_notification_type_id INT)
BEGIN
     UPDATE notification_types SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        notification_type_id = _notification_type_id;
END