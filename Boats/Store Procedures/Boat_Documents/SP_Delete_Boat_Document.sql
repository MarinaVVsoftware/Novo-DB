/* SP SP_DELETE_BOAT_DOCUMENT: Elimina un documento de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT_DOCUMENT`(_boat_document_id INT)
BEGIN
    DELETE FROM boat_documents WHERE boat_document_id = _boat_document_id;
END