/* Primero las tablas débiles */
DROP TABLE IF EXISTS document_Types;

/* Cable_Types y Socket_Types dependen de esta tabla */
DROP TABLE IF EXISTS boat_Electricity;
DROP TABLE IF EXISTS socket_Types;
DROP TABLE IF EXISTS cable_Types;

/* Slip_Types depende de slips,y slip occupation depende de slips */
DROP TABLE IF EXISTS slips_occupation;
DROP TABLE IF EXISTS slips;
DROP TABLE IF EXISTS slip_Types;

/* Tablas externas */
DROP TABLE IF EXISTS captains;
DROP TABLE IF EXISTS responsible;
DROP TABLE IF EXISTS engines;
DROP TABLE IF EXISTS documents;
DROP TABLE IF EXISTS slips;

/* Tabla Padre */
DROP TABLE IF EXISTS boats;