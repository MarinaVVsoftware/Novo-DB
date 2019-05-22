/* SP SP_READ_BOAT_DOCUMENTS_BY_CLIENT: Trae todos documentos de los barcos de un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOAT_DOCUMENTS_BY_CLIENT`(
    _client_id INT
)
BEGIN
    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM Clients WHERE client_id = _client_id) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Client was not found. Can\'t read boats without a client_id.';
    END IF;
    
    SELECT
        _boat_documents.boat_id AS boat_id,
        _boat_documents.boat_document_id AS boat_document_id,
        _boat_document_types.boat_document_type AS boat_document_type,
        _boat_document_types.required AS required,
        _boat_documents.url AS url,
        _boat_documents.last_update_date AS last_update_date
    FROM boat_documents AS _boat_documents
    LEFT OUTER JOIN boat_document_types AS _boat_document_types
    ON _boat_document_types.boat_document_type_id = _boat_documents.boat_document_type_id
    WHERE _boat_documents.boat_id IN (
        SELECT boat_id FROM boats WHERE boats.client_id = _client_id
    );
END