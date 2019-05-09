/* Primero las tablas débiles */
DROP TABLE Document_Types;

/* Cable_Types y Socket_Types dependen de esta tabla */
DROP TABLE Boat_Electricity;
DROP TABLE Socket_Types;
DROP TABLE Cable_Types;

/* Slip_Types depende de slips */
DROP TABLE Slips;
DROP TABLE Slip_Types;

/* Tablas externas */
DROP TABLE Captains;
DROP TABLE Responsible;
DROP TABLE Engines;
DROP TABLE Documents;
DROP TABLE Slips;

/* Tabla Padre */
DROP TABLE Boats;