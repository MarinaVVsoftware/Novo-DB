/* SP SP_Incidents_PostIncident: Crea un nuevo incidente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_PostIncident`(
    _username VARCHAR (200),
	_incident_type_id INT,
	_title VARCHAR(50),
	_description VARCHAR (300)
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
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "User was not found. Can't create incident without an user valid.";
    END IF;

    /* verifica que exista el incident type. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM incident_types 
        WHERE incident_type_id = _incident_type_id
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Incident type doesn't exist. Can't create incident without an incident type.";
    END IF;

    INSERT INTO incidents (
        _employee_id,
        _incident_type_id,
        _title,
        _description
    )
    VALUES (
        employee_id,
        incident_type_id,
        title,
        description
    );
END