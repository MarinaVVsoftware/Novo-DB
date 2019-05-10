/* Table "Engines"
Almacena la información de los motores asociados a sus barcos.
Cada barco puede tener un varios motores.

engine_id   -> id natural
boat_id     -> FK con la tabla "Boats"
model       -> Modelo del motor
brand       -> Marca del motor
logic_deleted       -> borrado lógico
logic_deleted_date  -> fecha de borrado lógico

PK = engine_id 
*/
CREATE TABLE IF NOT EXISTS engines(
    engine_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    model VARCHAR(100) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (engine_id)
);