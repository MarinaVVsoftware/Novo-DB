/* SP SP_DELETE_CAPTAIN: Elimina un capitán */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CAPTAIN`(_captain_id INT)
BEGIN
     UPDATE captains SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        captain_id = _captain_id;
END