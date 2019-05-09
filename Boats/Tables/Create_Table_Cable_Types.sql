/* Table "Cables" - TABLA DEBIL
Almacena la información eléctrica de los cables.

cable_type_id   -> id natural
cable_type      -> Nombre del tipo de Cable
amperage        -> Valor numérico del amperaje
description     -> Descripción del Cable
price           -> Precio del cable

PK = cable_id 
*/
CREATE TABLE IF NOT EXISTS Cable_Types(
    cable_type_id INT NOT NULL AUTO_INCREMENT,
    cable_type VARCHAR(50) UNIQUE NOT NULL,
    amperage SMALLINT NOT NULL,
    description VARCHAR(200),
    price FLOAT(12,6) NOT NULL,

    PRIMARY KEY (cable_type_id)
);