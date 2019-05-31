/* SP SP_PUT_BOAT_DOCUMENT: Crea o Actualiza un documento de barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PUT_BOAT_DOCUMENT`(
    _boat_name VARCHAR(100),
    _boat_document_type_id INT,
    _url VARCHAR(250)
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat doesn't exist.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    /* Si no existe un row con id de bote y id de 
    tipo es porque no existe, por lo que debe crearlo */
    IF NOT EXISTS (
        SELECT 1 FROM boat_documents 
        WHERE boat_id = @boat 
        AND boat_document_type_id = _boat_document_type_id
    ) 
    THEN
        /* Crea el documento dado que no existe */
        INSERT INTO boat_documents (
            boat_id, 
            boat_document_type_id, url
        )
        VALUES (
            @boat, 
            _boat_document_type_id, 
            _url
        );

        /* retorna el id del row insertado */
        SELECT LAST_INSERT_ID();
    ELSE
        UPDATE boat_documents
        SET url = _url, last_update_date = NOW()
        WHERE boat_id = @boat 
        AND boat_document_type_id = _boat_document_type_id;
    END IF;
END