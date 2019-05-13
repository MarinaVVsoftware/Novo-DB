/* SP SP_CREATE_BOAT_DOCUMENT_TYPE: Crea un tipo de documento de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_BOAT_DOCUMENT_TYPE`(
    _boat_document_type VARCHAR(100),
    _required BOOLEAN
)
BEGIN
    INSERT INTO boat_document_types(boat_document_type, required)
    VALUES(_boat_document_type, _required);
END