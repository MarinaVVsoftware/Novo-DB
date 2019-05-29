/* limpieza de todas las tablas. */

/* Primero las tablas débiles */
TRUNCATE TABLE boat_document_types;

/* Cable_Types y Socket_Types dependen de esta tabla */
TRUNCATE TABLE boat_electricity;
TRUNCATE TABLE socket_types;
TRUNCATE TABLE cable_types;

/* Slip_Types depende de slips,y slip occupation depende de slips */
TRUNCATE TABLE slips_occupation;
TRUNCATE TABLE slips;
TRUNCATE TABLE slip_types;

/* Tablas externas */
TRUNCATE TABLE captains;
TRUNCATE TABLE responsible;
TRUNCATE TABLE engines;
TRUNCATE TABLE boat_documents;
TRUNCATE TABLE slips;

/* Tabla Padre */
TRUNCATE TABLE boats;