/* Table "Captains"
Almacena la información de los capitanes asociados a sus barcos.
Cada barco puede tener un solo capitán.

captain_id              -> ID natural
boat_id                 -> FK con la tabla "Boats"
name                    -> Nombre del capitán
phone                   -> Teléfono del capitán
email                   -> Correo del capitán
payment_permission      -> Si posee permiso para realizar pagos
aceptation_permission   -> Si posee permiso para realizar aceptaciones
logic_deleted           -> Borrado lógico
logic_deleted_date      -> Fecha de borrado lógico

PK = captain_id 
*/
CREATE TABLE IF NOT EXISTS captains(
    captain_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    payment_permission BOOLEAN NOT NULL,
    aceptation_permission BOOLEAN NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (captain_id)
);