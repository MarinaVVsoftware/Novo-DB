/* SP SP_DELETE_CAPTAIN_BY_BOAT: Elimina el capitán de un barco */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CAPTAIN_BY_BOAT`(_boat_id INT)
BEGIN
    UPDATE captains SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        boat_id = _boat_id;
END