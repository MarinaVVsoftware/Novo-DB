/* SP SP_UPDATE_BOAT_DOCUMENT: Actualiza un documento de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_BOAT_DOCUMENT`(
    _boat_document_id INT,
    _boat_id INT,
    _boat_document_type_id INT,
    _url VARCHAR(250)
)
BEGIN
    UPDATE boat_documents SET
        boat_id = _boat_id,
        boat_document_type_id = _boat_document_type_id,
        url = _url,
        last_update_date = NOW()
    WHERE boat_document_id = _boat_document_id;
END