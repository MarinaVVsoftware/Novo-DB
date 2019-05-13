/* Table "Slips"
Almacena la información de los slips. 
Cada slip posee un barco, un barco puede poseer muchos slips, y cada slip
tiene solo un tipo de slip.

slip_id             -> id natural
slip_type_id        -> Tipo de slip
slip_name           -> Nombre del slip (código interno)
logic_deleted       -> borrado lógico
logic_deleted_date  -> fecha de borrado lógico

PK = slip_id 
*/
CREATE TABLE IF NOT EXISTS slips(
    slip_id INT NOT NULL AUTO_INCREMENT,
    slip_type_id INT NOT NULL,
    slip_name VARCHAR(100),
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (slip_id)
);