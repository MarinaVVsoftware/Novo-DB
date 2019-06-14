/* SP SP_Incidents_GetIncidents: Trae la lista de incidentes. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_GetIncidents`()
BEGIN
    SELECT 
        incident_id,
        employee_id,
        incident_type_id,
        title,
        description,
        creation_date
    FROM incidents 
    WHERE logical_deleted = 0;
END