/* SP SP_DELETE_RESPONSABLE: Elimina un responsable */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_RESPONSABLE`(_responsable_id INT)
BEGIN
    DELETE FROM responsible WHERE responsable_id = _responsable_id;
END