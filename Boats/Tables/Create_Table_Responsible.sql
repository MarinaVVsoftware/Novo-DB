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

PK = responsable_id 
*/
CREATE TABLE IF NOT EXISTS Responsible(
    responsable_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(50),
    payment_permission BINARY NOT NULL,
    aceptation_permission BINARY NOT NULL,

    PRIMARY KEY (responsable_id)
);