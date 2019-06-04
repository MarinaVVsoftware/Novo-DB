/* SP SP_READ_BOAT_DOCUMENT_TYPES: Trae los tipos de documentos de barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BoatDocumentTypes_GetTypes`()
BEGIN
    SELECT
        boat_document_type_id,
        boat_document_type,
        required
    FROM boat_document_types 
    WHERE logical_deleted = 0;
END