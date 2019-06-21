/* Table "Users"
Almacena la información de los usuarios de la empresa que
acceden y operan el sistema de Novonautica.

employee_id             -> ID natural
rol_id                  -> FK del rol del usuario
status_id               -> FK del estatus del usuario en el sistema
email                   -> Email del usuario, debe ser único
username                -> Nombre del usuario, debe ser único
recruitment_date        -> Fecha en la que se integró el usuario a la empresa
creation_date           -> Fecha de creación del usuario
logic_deleted           -> Borrado lógico
logic_deleted_date      -> Fecha de borrado lógico

PK = employee_id 
*/
 CREATE TABLE IF NOT EXISTS users (
	employee_id INT NOT NULL AUTO_INCREMENT,
    rol_id INT NOT NULL,
    status_id INT NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    username VARCHAR(200) UNIQUE NOT NULL,
    recruitment_date DATETIME NOT NULL,
    creation_date DATETIME DEFAULT NOW(),
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (employee_id)
);