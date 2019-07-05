/* SP SP_Incidents_GetIncidents: Trae la lista de incidentes. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_GetIncidents`()
BEGIN
    SELECT 
        incident_id AS incidentId,
        employee_id AS employeeId,
        incident_type_id AS incidentTypeId,
        title,
        description,
        creation_date AS creationDate
    FROM incidents 
    WHERE logical_deleted = 0;
END