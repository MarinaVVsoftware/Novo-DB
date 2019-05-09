/* SP SP_DELETE_BOAT: Elimina un barco */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT`(_boat_id INT)
BEGIN
     UPDATE boats SET
        logic_delete = 1,
        logic_delete_date = NOW()
    WHERE 
        boat_id = _boat_id;
END