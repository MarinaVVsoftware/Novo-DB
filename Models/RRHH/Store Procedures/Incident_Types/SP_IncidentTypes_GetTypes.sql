/* SP SP_IncidentTypes_GetTypes: Trae los tipos de Incidentes. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_IncidentTypes_GetTypes`()
BEGIN
    SELECT
        incident_type_id AS incidentTypeId,
        incident_type AS incidentType
    FROM incident_types;
END