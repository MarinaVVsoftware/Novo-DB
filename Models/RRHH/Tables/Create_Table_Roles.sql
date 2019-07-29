/* Table "Roles"
Almacena la información de los diferentes roles de los
usuarios de Novonautica. Cada rol tiene asociado un conjunto
de permisos en formato json que define las posibilidades de acceso
dentro del sistema.

rol_id         		-> ID natural
rank_id             -> FK del rango del rol
rol_name			-> Nombre del rol
permissions			-> Archivo json que mapea los permisos del rol
creation_date		-> Fecha de creación
logic_deleted       -> Borrado lógico
logic_deleted_date  -> Fecha de borrado lógico

PK = rol_id 
*/
 CREATE TABLE IF NOT EXISTS roles (
	rol_id INT NOT NULL AUTO_INCREMENT,
    rank_id INT NOT NULL,
	rol_name VARCHAR(50) UNIQUE NOT NULL,
	permissions LONGTEXT NOT NULL,
	creation_date DATETIME DEFAULT NOW(),
	logical_deleted BOOLEAN DEFAULT 0,
	logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (rol_id)
);