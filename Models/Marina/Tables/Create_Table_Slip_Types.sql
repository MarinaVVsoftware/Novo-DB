/* Table "Slip_Types" - TABLA DEBIL
Almacena los tipos de slips, se asocia con la tabla "Slips".
Cada slip puede tener solo un tipo de slip a la vez. 

slip_type_id        -> ID natural
slip_type           -> Tipo de slip
slip_min_ft         -> Mínimo tamaño de barco permitido
slip_max_ft         -> Máximo tamaño de barco permitido
logic_deleted       -> Borrado lógico
logic_deleted_date  -> Fecha de borrado lógico

PK = slip_type_id 
*/
CREATE TABLE IF NOT EXISTS slip_types(
    slip_type_id INT NOT NULL AUTO_INCREMENT,
    slip_type VARCHAR(100) NOT NULL,
    slip_min_ft INTEGER NOT NULL,
    slip_max_ft INTEGER NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (slip_type_id)
);
