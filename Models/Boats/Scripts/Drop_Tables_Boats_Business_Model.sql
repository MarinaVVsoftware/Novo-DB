/* Primero las tablas débiles */
DROP TABLE IF EXISTS boat_document_types;

/* Cable_Types y Socket_Types dependen de esta tabla */
DROP TABLE IF EXISTS boat_electricity;
DROP TABLE IF EXISTS socket_types;
DROP TABLE IF EXISTS cable_types;

/* Slip_Types depende de slips,y slip occupation depende de slips */
DROP TABLE IF EXISTS slips_occupation;
DROP TABLE IF EXISTS slips;
DROP TABLE IF EXISTS slip_types;

/* Tablas externas */
DROP TABLE IF EXISTS captains;
DROP TABLE IF EXISTS responsible;
DROP TABLE IF EXISTS engines;
DROP TABLE IF EXISTS boat_documents;
DROP TABLE IF EXISTS slips;

/* Tabla Padre */
DROP TABLE IF EXISTS boats;