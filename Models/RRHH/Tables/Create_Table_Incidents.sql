/* Table "Incidents"
Almacena la información de los usuarios de la empresa que
acceden y operan el sistema de Novonautica.

incident_id             -> ID natural
employee_id             -> FK del usuario
incident_type_id		-> Tipo de incidente
title					-> Título del incidente
description				-> Descripción más detallada del incidente
logic_deleted           -> Borrado lógico
logic_deleted_date      -> Fecha de borrado lógico

PK = incident_id 
*/
 CREATE TABLE IF NOT EXISTS incidents (
	incident_id INT NOT NULL AUTO_INCREMENT,
    employee_id INT NOT NULL,
	incident_type_id INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	description VARCHAR (300),
    creation_date DATETIME DEFAULT NOW(),
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (incident_id)
);