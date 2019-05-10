/* Table "Responsible"
Almacena la información de los responsable asociados a sus barcos.
Cada barco puede tener un solo responsable.

responsable_id          -> id natural
boat_id                 -> FK con la tabla "Boats"
name                    -> Nombre del responsable
phone                   -> Teléfono del responsable
email                   -> Correo del responsable
payment_permission      -> si posee permiso para realizar pagos
aceptation_permission   -> si posee permiso para realizar aceptaciones
logic_deleted           -> borrado lógico
logic_deleted_date      -> fecha de borrado lógico

PK = responsable_id 
*/
CREATE TABLE IF NOT EXISTS responsible(
    responsable_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(50),
    payment_permission BOOLEAN NOT NULL,
    aceptation_permission BOOLEAN NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,
    
    PRIMARY KEY (responsable_id)
);