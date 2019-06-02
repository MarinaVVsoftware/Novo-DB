/* SP SP_READ_BOAT_DOCUMENTS_BY_BOAT: Trae todos documentos de un barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOAT_DOCUMENTS_BY_BOAT`(
    _client_id INT,    
    _boat_name VARCHAR(100)
)
BEGIN
    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM clients 
        WHERE client_id = _client_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't read boat documents without a client id valid.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't reat boat documents without a boat name valid.";
    END IF;

    /* Verifica si el cliente tiene un bote con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND name = _boat_name
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
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
            WHERE boats.name = _boat_name 
            AND boats.logical_deleted = 0
        );
    END IF;
END