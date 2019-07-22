/* SP SP_Incidents_PutById: Modifica un incidente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_PutById`(
    _username VARCHAR (200),
    _incident_id INT,
	_incident_type_id INT,
	_title VARCHAR(50),
	_description VARCHAR (300)
)
BEGIN
    /* verifica que exista el incidente a modificar. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM incidents 
        WHERE incident_id = _incident_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000";
    END IF;

    /* verifica que exista el user. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM users 
        WHERE username = _username
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45001";
    END IF;

    /* verifica que exista el incident type. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM incident_types 
        WHERE incident_type_id = _incident_type_id
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45002";
    END IF;

        /* Guarda el id del usuario en una variable */ 
    SELECT employee_id INTO @employee 
    FROM users 
    WHERE username = _username
    AND logical_deleted = 0;

    /* Verifica si el usuario tiene un incidente con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM incidents 
        WHERE incident_id = _incident_id
        AND employee_id = @employee
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45003";
    END IF;

    UPDATE incidents SET
        incident_type_id = _incident_type_id,
        title = _title,
        description = _description
    WHERE incident_id = _incident_id;
END