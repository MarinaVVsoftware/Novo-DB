/* Table "marina_mooring_tariff_types" - TABLA DEBIL
Almacena los tipos de tarifas

marina_mooring_tariff_type_id   -> ID natural
tariff_type                    -> Nombre del tipo de tarifa

PK = incident_type_id 
*/
CREATE TABLE IF NOT EXISTS marina_mooring_tariff_types (
    marina_mooring_tariff_type_id INT NOT NULL AUTO_INCREMENT, 
    tariff_type VARCHAR(100) NOT NULL,

    PRIMARY KEY(marina_mooring_tariff_type_id)
);