/* Table "Slips" - TABLA DEBIL
Almacena la información de los slips. Cada slip posee un barco, un 
barco puede poseer muchos slips, y cada slip tiene solo un tipo de slip.

slip_id             -> ID natural
slip_type_id        -> Tipo de slip
logic_deleted       -> Borrado lógico
logic_deleted_date  -> Fecha de borrado lógico

PK = slip_id 
*/
CREATE TABLE IF NOT EXISTS slips(
    slip_id INT NOT NULL AUTO_INCREMENT,
    slip_type_id INT NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (slip_id)
);