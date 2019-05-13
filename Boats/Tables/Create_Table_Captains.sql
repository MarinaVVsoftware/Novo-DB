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
logic_deleted           -> borrado lógico
logic_deleted_date      -> fecha de borrado lógico

PK = captain_id 
*/
CREATE TABLE IF NOT EXISTS captains(
    captain_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    name VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    payment_permission BOOLEAN NOT NULL,
    aceptation_permission BOOLEAN NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (captain_id)
);