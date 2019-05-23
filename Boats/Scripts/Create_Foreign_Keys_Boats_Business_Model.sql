/* FOREIGN KEYS de las tablas del grupo "Boats".
regla de convención de FK:

FK_[nombre de la tabla que tiene dependencia de]_[nombre del PK de la tabla padre]
*/

/* Boats -> Clients */
ALTER TABLE boats
ADD CONSTRAINT FK_boats_client_id
FOREIGN KEY (client_id) REFERENCES clients(client_id);

/* Captains -> Boats */
ALTER TABLE captains
ADD CONSTRAINT FK_captains_boat_id
FOREIGN KEY (boat_id) REFERENCES boats(boat_id);

/* Responsible -> Boats */
ALTER TABLE responsible
ADD CONSTRAINT FK_responsible_boat_id
FOREIGN KEY (boat_id) REFERENCES boats(boat_id);

/* Engines -> Boats */
ALTER TABLE engines
ADD CONSTRAINT FK_engines_boat_id
FOREIGN KEY (boat_id) REFERENCES boats(boat_id);

/* Documents -> Boats */
ALTER TABLE documents
ADD CONSTRAINT FK_documents_boat_id
FOREIGN KEY (boat_id) REFERENCES boats(boat_id);

/* Boat_Electricity -> Boats */
ALTER TABLE boat_electricity
ADD CONSTRAINT FK_boat_electricity_boat_id
FOREIGN KEY (boat_id) REFERENCES boats(boat_id);

/* Boat_Electricity -> Cable_Types */
ALTER TABLE boat_electricity
ADD CONSTRAINT FK_boat_electricity_cable_type_id
FOREIGN KEY (cable_type_id) REFERENCES cable_types(cable_type_id);

/* Boat_Electricity -> Socket_Types */
ALTER TABLE boat_electricity
ADD CONSTRAINT FK_boat_electricity_socket_type_id
FOREIGN KEY (socket_type_id) REFERENCES socket_types(socket_type_id);

/* Slips -> Slip_Types */
ALTER TABLE slips
ADD CONSTRAINT FK_slips_slip_type_id
FOREIGN KEY (slip_type_id) REFERENCES slip_types(slip_type_id);

/* Slips_Occupation -> Boats */
ALTER TABLE slips_occupation
ADD CONSTRAINT FK_slips_occupation_boat_id
FOREIGN KEY (boat_id) REFERENCES boats(boat_id);

/* Slips_Occupation -> Slips */
ALTER TABLE slips_occupation
ADD CONSTRAINT FK_slips_occupation_slip_id
FOREIGN KEY (slip_id) REFERENCES slips(slip_id);