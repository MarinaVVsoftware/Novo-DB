/* SP SP_DELETE_SLIP_TYPE: Elimina un tipo de slip */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_SLIP_TYPE`(_slip_type_id INT)
BEGIN
     UPDATE slip_types SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        slip_type_id = _slip_type_id;
END