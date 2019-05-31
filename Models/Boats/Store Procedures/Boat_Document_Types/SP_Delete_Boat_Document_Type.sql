/* SP SP_DELETE_BOAT_DOCUMENT_TYPE: Elimina un tipo de documento de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT_DOCUMENT_TYPE`(
    _boat_document_type_id INT
)
BEGIN
     UPDATE boat_document_types SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE boat_document_type_id = _boat_document_type_id;
END