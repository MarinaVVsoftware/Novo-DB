/* SP SP_DELETE_CABLE_TYPE: Elimina un tipo de cable */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CABLE_TYPE`(_cable_type_id INT)
BEGIN
     UPDATE cable_types SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE cable_type_id = _cable_type_id;
END