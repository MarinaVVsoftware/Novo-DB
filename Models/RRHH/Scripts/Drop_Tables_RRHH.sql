/* Primero las tablas débiles */
DROP TABLE IF EXISTS ranks;
DROP TABLE IF EXISTS incident_types;

/* NOTA!!: la tabla "Clients" depende de esta tabla, por lo
que no podrá ser dropeada de la misma manera. */
/* DROP TABLE IF EXISTS status; */

/* Users depende de estas tablas */
DROP TABLE IF EXISTS incidents;
DROP TABLE IF EXISTS roles;

/* Tabla principal */
DROP TABLE IF EXISTS users;