/* Table "Incidents" - TABLA DEBIL
Almacena los tipos de incidentes de empleados.

incident_type_id    -> ID natural
incident_type       -> Nombre del tipo de incidente

PK = incident_type_id 
*/
 CREATE TABLE IF NOT EXISTS incident_types (
	incident_type_id INT NOT NULL AUTO_INCREMENT,
    incident_type VARCHAR(50) UNIQUE NOT NULL,

    PRIMARY KEY (incident_type_id)
);