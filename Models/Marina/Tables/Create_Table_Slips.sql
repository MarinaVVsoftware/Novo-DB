/* Table "Slips" - TABLA DEBIL
Almacena la información de los slips. Cada slip posee un barco, un 
barco puede poseer muchos slips, y cada slip tiene solo un tipo de slip.

slip_id             -> ID natural
slip_type_id        -> Tipo de slip
slip_name           -> Nombre del slip. No necesariamente coincide con el id

PK = slip_id 
*/
CREATE TABLE IF NOT EXISTS slips(
    slip_id INT NOT NULL AUTO_INCREMENT,
    slip_type_id INT NOT NULL,
    slip_name VARCHAR(20) NOT NULL,

    PRIMARY KEY (slip_id)
);