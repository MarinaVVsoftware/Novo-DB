/* SP SP_DELETE_BOAT_ELECTRICITY: Elimina una relación de configuración eléctrica. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT_ELECTRICITY`(_boat_electricity_id INT)
BEGIN
     UPDATE boat_electricity SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        boat_electricity_id = _boat_electricity_id;
END