/* Table "Boats"
Almacena la información de los botes asociados a un cliente.
Un cliente puede tener muchos botes.

boat_id             -> ID natural
client_id           -> FK con la tabla "Clients"
name                -> Nombre del barco
model               -> Modelo del barco
loa                 -> Eslora
draft               -> Calado
beam                -> Manga
creation_date       -> Fecha de creación del bote
logic_deleted       -> Borrado lógico
logic_deleted_date  -> Fecha de borrado lógico

PK = boat_id 
*/
CREATE TABLE IF NOT EXISTS boats(
    boat_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    name VARCHAR(100) UNIQUE NOT NULL,
    model VARCHAR(100),
    loa DECIMAL(6,2) NOT NULL,
    draft DECIMAL(6,2),
    beam DECIMAL(6,2),
    creation_date DATETIME NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (boat_id)
);