/* SP SP_READ_BOAT_DOCUMENTS: Trae los documentos de barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOAT_DOCUMENTS`()
BEGIN
    SELECT
        boat_document_id,
        boat_id,
        boat_document_type_id,
        url,
        last_update_date 
    FROM boat_documents;
END