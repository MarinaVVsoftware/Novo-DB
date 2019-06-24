/* Table "Clients"
Almacena la información de los clientes de la empresa.

client_id               -> ID natural
status_id               -> FK con el status del cliente
name                    -> Nombre del cliente
email                   -> Email del cliente
phone                   -> Teléfono del cliente
address                 -> Dirección del cliente
creation_date           -> Fecha de creación
logic_deleted           -> Borrado lógico
logic_deleted_date      -> Fecha de borrado lógico

PK = client_id 
*/
 CREATE TABLE IF NOT EXISTS clients (
	client_id INT NOT NULL AUTO_INCREMENT,
    status_id INT NOT NULL,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(300),
    creation_date DATETIME DEFAULT NOW(),
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (client_id)
);