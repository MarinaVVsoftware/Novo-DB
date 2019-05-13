/* SP SP_UPDATE_NOTIFICATION_TYPE: Actualiza un tipo de notificación. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_NOTIFICATION_TYPE`(
    _notification_type_id INT,
    _notification_type VARCHAR(100)
)
BEGIN
    UPDATE notification_types SET
        notification_type = _notification_type
    WHERE 
        notification_type_id = _notification_type_id;
END