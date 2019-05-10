/* SP SP_READ_BOAT_DOCUMENT_TYPES: Trae los tipos de documentos de barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOAT_DOCUMENT_TYPES`()
BEGIN
    SELECT * FROM boat_document_types WHERE logical_deleted = 0;
END