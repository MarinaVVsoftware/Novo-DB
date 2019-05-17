/* Table "Sockets" - TABLA DEBIL
Almacena la información eléctrica de los conectores de cables (sockets).

socket_type_id      -> id natural
socket_type         -> Nombre del tipo de socket
description         -> Descripción del socket
logic_deleted       -> borrado lógico
logic_deleted_date  -> fecha de borrado lógico

PK = socket_type_id
*/
CREATE TABLE IF NOT EXISTS socket_types(
    socket_type_id INT NOT NULL AUTO_INCREMENT,
    socket_type VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(200),
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (socket_type_id)
);