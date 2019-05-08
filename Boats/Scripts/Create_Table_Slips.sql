/* Table "Slips"
Almacena la información de los slips. 
Cada slip posee un barco, un barco puede poseer muchos slips, y cada slip
tiene solo un tipo de slip.

slip_id         -> id natural
slip_type_id    -> Tipo de slip
boat_id         -> id del bote que está asignado a ese slip
slip_name       -> Nombre del slip (código interno)

PK = slip_id 
*/
CREATE TABLE IF NOT EXISTS Slips(
    slip_id INT NOT NULL AUTO_INCREMENT,
    slip_type_id INT NOT NULL,
    boat_id INT,
    slip_name VARCHAR(20),

    PRIMARY KEY (slip_id)
);