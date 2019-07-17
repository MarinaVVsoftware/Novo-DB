/* Table "marina_quotation_status" - TABLA DEBIL
Almacena los status de las cotizaciones

marina_quotation_status_id  -> ID natural
status                      -> Nombre del status

PK = incident_type_id 
*/
CREATE TABLE IF NOT EXISTS marina_quotation_status (
    marina_quotation_status_id INT NOT NULL AUTO_INCREMENT,
    status VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(marina_quotation_status_id)
);