/* Table "Boat_Electricity"
Almacena la información eléctrica asociada a cada barco.
Un cliente puede tener muchos cables y conectores.

boat_electricity_id     -> id natural
boat_type_id            -> FK con la tabla "Boats"
cable_type_id           -> FK con la tabla "Cables"
socket_type_id          -> FK con la tabla "Sockets"

PK = boat_electricity_id 
*/
CREATE TABLE IF NOT EXISTS Boat_Electricity(
    boat_electricity_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    cable_type_id INT NOT NULL,
    socket_type_id INT NOT NULL,

    PRIMARY KEY (boat_electricity_id)
);