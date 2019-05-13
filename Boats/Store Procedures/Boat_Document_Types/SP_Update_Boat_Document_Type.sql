/* SP SP_UPDATE_BOAT_DOCUMENT_TYPE: Actualiza un tipo de documento de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_BOAT_DOCUMENT_TYPE`(
    _boat_document_type_id INT,
    _boat_document_type VARCHAR(100),
    _required BOOLEAN
)
BEGIN
    UPDATE boat_document_types SET
        boat_document_type = _boat_document_type,
        required = _required
    WHERE 
        boat_document_type_id = _boat_document_type_id;
END