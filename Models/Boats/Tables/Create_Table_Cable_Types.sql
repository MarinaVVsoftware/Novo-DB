/* Table "Cable_Types" - TABLA DEBIL
Almacena la información eléctrica de los cables.

cable_type_id       -> ID natural
cable_type          -> Nombre del tipo de Cable
voltage             -> Valor numérico del voltaje
description         -> Descripción del Cable
price               -> Precio del cable
logic_deleted       -> borrado lógico
logic_deleted_date  -> fecha de borrado lógico

PK = cable_id 
*/
CREATE TABLE IF NOT EXISTS cable_types(
    cable_type_id INT NOT NULL AUTO_INCREMENT,
    cable_type VARCHAR(100) UNIQUE NOT NULL,
    voltage SMALLINT NOT NULL,
    description VARCHAR(200),
    price DECIMAL(12,4) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (cable_type_id)
);