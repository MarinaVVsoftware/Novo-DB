/* SP SP_DELETE_BOAT_DOCUMENT: Elimina un documento de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT_DOCUMENT`(_boat_document_id INT)
BEGIN
     UPDATE boat_documents SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE 
        boat_document_id = _boat_document_id;
END