/* Table "Sockets" - TABLA DEBIL
Almacena la información eléctrica de los conectores de cables (sockets).

socket_id        -> id natural
type            -> Nombre del tipo de socket
description     -> Descripción del socket

PK = socket_id 
*/
CREATE TABLE IF NOT EXISTS Sockets(
    socket_id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(200),

    PRIMARY KEY (socket_id)
);