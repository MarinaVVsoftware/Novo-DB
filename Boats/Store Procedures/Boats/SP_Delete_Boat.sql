/* SP SP_DELETE_BOAT: Elimina un barco */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT`(_boat_id INT)
BEGIN
    UPDATE boats SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        boat_id = _boat_id;
END