/* Table "Boat_Document_Types"  - TABLA DEBIL
Almacena la información de los tipos de documentos.

boat_document_type_id   -> ID natural
boat_document_type      -> Nombre del tipo de document
required                -> Si es requerido o no en el front
logic_deleted           -> Borrado lógico
logic_deleted_date      -> Fecha de borrado lógico

PK = document_type_id 
*/
CREATE TABLE IF NOT EXISTS boat_document_types(
    boat_document_type_id INT NOT NULL AUTO_INCREMENT,
    boat_document_type VARCHAR(100) NOT NULL,
    required BOOLEAN NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (boat_document_type_id)
);