/* FOREIGN KEYS de las tablas del modelo de negocio "RRHH".

reglas de convención de FK:

FK_[nombre de la tabla que tiene dependencia de]_[nombre del PK de la tabla padre]
*/

/* users -> roles */
ALTER TABLE users
ADD CONSTRAINT FK_roles_rol_id
FOREIGN KEY (rol_id) REFERENCES roles(rol_id);

/* users -> status */
ALTER TABLE users
ADD CONSTRAINT FK_users_status_id
FOREIGN KEY (status_id) REFERENCES status(status_id);

/* roles -> ranks */
ALTER TABLE roles
ADD CONSTRAINT FK_roles_rank_id
FOREIGN KEY (rank_id) REFERENCES ranks(rank_id);

/* incidents -> users */
ALTER TABLE incidents
ADD CONSTRAINT FK_incidents_employee_id
FOREIGN KEY (employee_id) REFERENCES users(employee_id);

/* incidents -> incident_types */
ALTER TABLE incidents
ADD CONSTRAINT FK_incident_incident_type_id
FOREIGN KEY (incident_type_id) REFERENCES incident_types(incident_type_id);