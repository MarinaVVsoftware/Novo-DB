/* SP SP_READ_BOAT_DOCUMENTS: Trae los documentos de barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOAT_DOCUMENTS`()
BEGIN
    SELECT * FROM boat_documents WHERE logical_deleted = 0;
END