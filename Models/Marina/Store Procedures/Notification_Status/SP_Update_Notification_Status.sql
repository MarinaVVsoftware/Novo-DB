/* SP SP_UPDATE_NOTIFICATION_STATUS: Actualiza un tipo estado de notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_NOTIFICATION_STATUS`(
    _notification_status_id INT,
    _notification_status VARCHAR(100)
)
BEGIN
    UPDATE notification_status SET
        notification_status = _notification_status
    WHERE 
        notification_status_id = _notification_status_id;
END