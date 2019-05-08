/* Table "Cables" - TABLA DEBIL
Almacena la información eléctrica de los cables.

cable_id        -> id natural
type            -> Nombre del tipo de Cable
amperage        -> Valor numérico del amperaje
description     -> Descripción del Cable
price           -> Precio del cable

PK = cable_id 
*/
CREATE TABLE IF NOT EXISTS Cables(
    cable_id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(50) UNIQUE NOT NULL,
    amperage SMALLINT NOT NULL,
    description VARCHAR(200),
    price FLOAT(12,6) NOT NULL,

    PRIMARY KEY (cable_id)
);