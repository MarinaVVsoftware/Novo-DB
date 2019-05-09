/* Primero las tablas débiles */
DROP TABLE document_Types;

/* Cable_Types y Socket_Types dependen de esta tabla */
DROP TABLE boat_Electricity;
DROP TABLE socket_Types;
DROP TABLE cable_Types;

/* Slip_Types depende de slips */
DROP TABLE slips;
DROP TABLE slip_Types;

/* Tablas externas */
DROP TABLE captains;
DROP TABLE responsible;
DROP TABLE engines;
DROP TABLE documents;
DROP TABLE slips;

/* Tabla Padre */
DROP TABLE boats;