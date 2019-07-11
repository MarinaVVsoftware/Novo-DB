/* SP SP_BoatDocuments_GetByBoat: Trae todos documentos de un barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BoatDocuments_GetByBoat`(
    _client_id INT,    
    _boat_name VARCHAR(100)
)
BEGIN
    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM clients 
        WHERE client_id = _client_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't read boat documents without a client id valid.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE name = _boat_name
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't read boat documents without a boat name valid.";
    END IF;

    /* Verifica si el cliente tiene un bote con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND name = _boat_name
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
    END IF;

    SELECT
        _boat_documents.boat_id AS boatId,
        _boat_documents.boat_document_id AS boatDocumentId,
        _boat_document_types.boat_document_type AS boatDocumentType,
        _boat_document_types.required AS required,
        _boat_documents.url AS url,
        _boat_documents.last_update_date AS lastUpdateDate
    FROM boat_documents AS _boat_documents
    LEFT OUTER JOIN boat_document_types AS _boat_document_types
    ON (_boat_document_types.boat_document_type_id = _boat_documents.boat_document_type_id
        AND _boat_documents.logical_deleted = 0)
    WHERE _boat_documents.boat_id 
    IN (
        SELECT boat_id 
        FROM boats 
        WHERE boats.name = _boat_name 
        AND boats.logical_deleted = 0
    )
    ORDER BY _boat_documents.boat_document_id ASC;
END