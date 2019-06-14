
/* SP SP_Fill_Weak_Tables_RRHH: Llena las tablas debiles del modelo de RRHH */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Fill_Weak_Tables_RRHH`()
BEGIN
    INSERT INTO ranks (rank_name, rank_weight) VALUES ("Super Administrador", 1);
    INSERT INTO ranks (rank_name, rank_weight) VALUES ("Alta", 2);
    INSERT INTO ranks (rank_name, rank_weight) VALUES ("Baja", 3);

    INSERT INTO status (status_name) VALUES ("Activo");
    INSERT INTO status (status_name) VALUES ("Inactivo");
    INSERT INTO status (status_name) VALUES ("Baja");

    INSERT INTO incident_types (incident_type) VALUES ("Vacaciones");
    INSERT INTO incident_types (incident_type) VALUES ("Permiso");
    INSERT INTO incident_types (incident_type) VALUES ("Incidente");
    INSERT INTO incident_types (incident_type) VALUES ("Reporte");
    INSERT INTO incident_types (incident_type) VALUES ("Acta Administrativa");
    INSERT INTO incident_types (incident_type) VALUES ("Falta");
END

