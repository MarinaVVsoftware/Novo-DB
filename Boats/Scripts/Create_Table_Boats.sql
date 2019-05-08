/* Table "Boats"
Almacena la información de los botes asociados a un cliente.
Un cliente puede tener muchos botes.

boat_id     -> id natural
client_id   -> FK con la tabla "Clients"
name        -> Nombre del barco
model       -> Modelo del barco
loa         -> eslora
draft       -> calado
beam        -> manga. estas medidas son float (3,2).

PK = boat_id 
*/
CREATE TABLE IF NOT EXISTS Boats(
    boat_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    model VARCHAR(50),
    loa FLOAT(3,2) NOT NULL,
    draft FLOAT(3,2),
    beam FLOAT(3,2),

    PRIMARY KEY (boat_id)
);