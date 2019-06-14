/* SP SP_Incidents_PutById: Modifica un incidente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_PutById`(
    _incident_id INT,
    _employee_id INT,
	_incident_type_id INT,
	_title VARCHAR(50),
	_description VARCHAR (300)
)
BEGIN
    /* verifica que exista el incidente a modificar. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM incidents 
        WHERE incident_type_id = _incident_type_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Incident was not found. Can't update incident if not exist.";
    END IF;

    /* verifica que exista el user. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM users 
        WHERE employee_id = _employee_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "User was not found. Can't update incident without an user valid.";
    END IF;

    /* verifica que exista el incident type. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM incident_types 
        WHERE incident_type_id = _incident_type_id
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Incident type doesn't exist. Can't update incident without an incident type.";
    END IF;

    UPDATE incidents SET
        employee_id = _employee_id,
        incident_type_id = _incident_type_id,
        title = _title,
        description = _description
    WHERE incident_id = _incident_id;
END