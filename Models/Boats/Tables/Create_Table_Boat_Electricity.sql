/* Table "Boat_Electricity"
Almacena la información eléctrica asociada a cada barco.
Un cliente puede tener muchos cables y conectores.

boat_electricity_id     -> ID natural
boat_type_id            -> FK con la tabla "Boats"
cable_type_id           -> FK con la tabla "Cables"
socket_type_id          -> FK con la tabla "Sockets"
logic_deleted           -> Borrado lógico
logic_deleted_date      -> Fecha de borrado lógico

PK = boat_electricity_id 
*/
CREATE TABLE IF NOT EXISTS boat_electricity(
    boat_electricity_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    cable_type_id INT NOT NULL,
    socket_type_id INT NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (boat_electricity_id)
);