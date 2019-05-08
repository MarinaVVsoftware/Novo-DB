/* FOREIGN KEYS de las tablas del grupo "Boats".
regla de convención de FK:

FK_[nombre de la tabla que tiene dependencia de]_[nombre del PK de la tabla padre]
*/

/* Boats -> Clients */
ALTER TABLE Boats
ADD CONSTRAINT FK_boats_client_id
FOREIGN KEY (client_id) REFERENCES Clients(client_id);

/* Captains -> Boats */
ALTER TABLE Captains
ADD CONSTRAINT FK_captains_boat_id
FOREIGN KEY (boat_id) REFERENCES Boats(boat_id);

/* Responsible -> Boats */
ALTER TABLE Responsible
ADD CONSTRAINT FK_responsible_boat_id
FOREIGN KEY (boat_id) REFERENCES Boats(boat_id);

/* Engines -> Boats */
ALTER TABLE Engines
ADD CONSTRAINT FK_engines_boat_id
FOREIGN KEY (boat_id) REFERENCES Boats(boat_id);

/* Documents -> Boats */
ALTER TABLE Documents
ADD CONSTRAINT FK_documents_boat_id
FOREIGN KEY (boat_id) REFERENCES Boats(boat_id);

/* Boat_Electricity -> Boats */
ALTER TABLE Boat_Electricity
ADD CONSTRAINT FK_boat_electricity_boat_id
FOREIGN KEY (boat_id) REFERENCES Boats(boat_id);

/* Boat_Electricity -> Cables */
ALTER TABLE Boat_Electricity
ADD CONSTRAINT FK_boat_electricity_cable_type_id
FOREIGN KEY (cable_type_id) REFERENCES Cables(cable_type_id);

/* Boat_Electricity -> Sockets */
ALTER TABLE Boat_Electricity
ADD CONSTRAINT FK_boat_electricity_socket_type_id
FOREIGN KEY (socket_type_id) REFERENCES Sockets(socket_type_id);

/* Slips -> Slip_Types */
ALTER TABLE Slips
ADD CONSTRAINT FK_slips_slip_type_id
FOREIGN KEY (slip_type_id) REFERENCES Slip_Types(slip_type_id);

/* Slips -> Boats */
ALTER TABLE Slips
ADD CONSTRAINT FK_slips_boat_id
FOREIGN KEY (boat_id) REFERENCES Boats(boat_id);