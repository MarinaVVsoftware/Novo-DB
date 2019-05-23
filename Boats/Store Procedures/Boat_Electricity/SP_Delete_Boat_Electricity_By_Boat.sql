/* SP SP_DELETE_BOAT_ELECTRICITY_BY_BOAT: Elimina las 
relaciones de configuración eléctrica de un barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT_ELECTRICITY_BY_BOAT`(_boat_id INT)
BEGIN
    UPDATE boat_electricity SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        boat_id = _boat_id;
END