/* SP SP_DELETE_RESPONSABLE_BY_BOAT: Elimina el responsable de un barco */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_RESPONSABLE_BY_BOAT`(_boat_id INT)
BEGIN
    UPDATE responsable SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        boat_id = _boat_id;
END