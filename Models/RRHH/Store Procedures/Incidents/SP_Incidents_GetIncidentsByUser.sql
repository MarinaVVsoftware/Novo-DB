/* SP SP_Incidents_GetIncidentsByUser: Trae la lista de incidentes. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_GetIncidentsByUser`(
    _username INT
)
BEGIN
    /* verifica que exista el user. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM users 
        WHERE username = _username
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000";
    END IF;

    /* Guarda el id del usuario en una variable */ 
    SELECT employee_id INTO @employee 
    FROM users 
    WHERE username = _username
    AND logical_deleted = 0;

    SELECT 
        incident_id AS incidentId,
        employee_id AS employeeId,
        incident_type_id AS incidentTypeId,
        title,
        description,
        creation_date AS creationDate
    FROM incidents 
    WHERE employee_id = @employee
    AND logical_deleted = 0;
END