/* Table "Estatus" TABLA DEBIL
Almacena información acerca los diferentes estados que puede
tener un cliente y un usuario (se usa en ambos) dentro del sistema,
tal como baja, activo, inactivo, etc.

status_id       -> ID natural
status_name     -> Nombre del estatus

PK = rank_id 
*/
 CREATE TABLE IF NOT EXISTS status (
	status_id INT NOT NULL AUTO_INCREMENT,
    status_name VARCHAR(50) UNIQUE NOT NULL,

    PRIMARY KEY (status_id)
);
