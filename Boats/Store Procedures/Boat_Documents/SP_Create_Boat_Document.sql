/* SP SP_CREATE_BOAT_DOCUMENT: Crea un documento de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_BOAT_DOCUMENT`(
    _boat_id INT,
    _boat_document_type_id INT,
    _url VARCHAR(250)
)
BEGIN
    INSERT INTO boat_documents(boat_id, boat_document_type_id, url)
    VALUES(_boat_id, _boat_document_type_id, _url);
END