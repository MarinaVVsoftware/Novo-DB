/* Table "Engines"
Almacena la información de los motores asociados a sus barcos.
Cada barco puede tener un varios motores.

engine_id   -> id natural
boat_id     -> FK con la tabla "Boats"
model       -> Modelo del motor
brand       -> Marca del motor

PK = engine_id 
*/
CREATE TABLE IF NOT EXISTS engines(
    engine_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    model VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,

    PRIMARY KEY (engine_id)
);