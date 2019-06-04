/* limpieza de todas las tablas. */

/* Primero las tablas débiles */
TRUNCATE TABLE boat_document_types;

/* Cable_Types y Socket_Types dependen de esta tabla */
TRUNCATE TABLE boat_electricity;
TRUNCATE TABLE socket_types;
TRUNCATE TABLE cable_types;

/* Tablas externas */
TRUNCATE TABLE captains;
TRUNCATE TABLE responsible;
TRUNCATE TABLE engines;
TRUNCATE TABLE boat_documents;

/* Tabla Padre */
TRUNCATE TABLE boats;