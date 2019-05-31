/* SP SP_READ_BOAT_DOCUMENTS_BY_BOAT: Trae todos documentos de un barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOAT_DOCUMENTS_BY_BOAT`(
    _name VARCHAR(100)
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _name
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat doesn't exist.";
    ELSE
        SELECT
            _boat_documents.boat_id AS boat_id,
            _boat_documents.boat_document_id AS boat_document_id,
            _boat_document_types.boat_document_type AS boat_document_type,
            _boat_document_types.required AS required,
            _boat_documents.url AS url,
            _boat_documents.last_update_date AS last_update_date
        FROM boat_documents AS _boat_documents
        LEFT OUTER JOIN boat_document_types AS _boat_document_types
        ON (_boat_document_types.boat_document_type_id = _boat_documents.boat_document_type_id
            AND _boat_documents.logical_deleted = 0)
        WHERE _boat_documents.boat_id 
        IN (
            SELECT boat_id 
            FROM boats 
            WHERE boats.name = _name 
            AND boats.logical_deleted = 0
        );
    END IF;
END