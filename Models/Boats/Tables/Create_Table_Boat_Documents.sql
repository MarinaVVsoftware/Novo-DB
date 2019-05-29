/* Table "Documents"
Almacena la información de los documentos asociados a sus barcos.
Cada barco puede tener un solo documento de cada tipo.

document_id             -> ID natural
boat_id                 -> FK con la tabla "Boats"
document_type_id        -> ID del tipo de documento
url                     -> Url de la ubicación del documento
last_update_date        -> Última fecha de actualización
logic_deleted           -> Borrado lógico
logic_deleted_date      -> Fecha de borrado lógico

PK = document_id 
*/
CREATE TABLE IF NOT EXISTS boat_documents(
    boat_document_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    boat_document_type_id INT,
    url VARCHAR(250),
    last_update_date DATETIME,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (boat_document_id)
);