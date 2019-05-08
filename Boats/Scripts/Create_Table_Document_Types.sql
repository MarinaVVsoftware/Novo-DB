/* Table "Documents_Types"  - TABLA DEBIL
Almacena la información de los tipos de documentos.

document_type_id    -> id natural
document_type       -> nombre del tipo de document
required            -> si es requerido o no en el front

PK = document_type_id 
*/
CREATE TABLE IF NOT EXISTS Documents(
    document_type_id INT NOT NULL AUTO_INCREMENT,
    document_type VARCHAR(50) NOT NULL,
    required BINARY NOT NULL,

    PRIMARY KEY (document_type_id)
);