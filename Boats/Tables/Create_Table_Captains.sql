/* Table "Captains"
Almacena la información de los capitanes asociados a sus barcos.
Cada barco puede tener un solo capitán.

captain_id              -> id natural
boat_id                 -> FK con la tabla "Boats"
name                    -> Nombre del capitán
phone                   -> Teléfono del capitán
email                   -> Correo del capitán
payment_permission      -> si posee permiso para realizar pagos
aceptation_permission   -> si posee permiso para realizar aceptaciones

PK = captain_id 
*/
CREATE TABLE IF NOT EXISTS Captains(
    captain_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(50),
    payment_permission BINARY NOT NULL,
    aceptation_permission BINARY NOT NULL,

    PRIMARY KEY (captain_id)
);