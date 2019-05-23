/* SP SP_DELETE_RESPONSABLE: Elimina un responsable */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_RESPONSABLE`(_responsable_id INT)
BEGIN
     UPDATE responsable SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        responsable_id = _responsable_id;
END