/* SP SP_IncidentTypes_GetTypes: Trae los tipos de Incidentes. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_IncidentTypes_GetTypes`()
BEGIN
    SELECT * FROM incident_types;
END