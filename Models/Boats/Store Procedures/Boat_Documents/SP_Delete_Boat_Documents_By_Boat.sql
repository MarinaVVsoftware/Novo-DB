/* SP SP_DELETE_BOAT_DOCUMENTS_BY_BOAT: Elimina los documentos de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT_DOCUMENTS_BY_BOAT`(
    _boat_id INT
)
BEGIN
    UPDATE boat_documents SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE boat_id = _boat_id;
END