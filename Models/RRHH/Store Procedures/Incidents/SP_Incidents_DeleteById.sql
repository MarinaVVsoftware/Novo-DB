/* SP SP_Incidents_DeleteById: Elimina un incidente por su id. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_DeleteById`(
    _username VARCHAR(200),
    _incident_id INT
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

    /* verifica que exista el user. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM incidents 
        WHERE incident_id = _incident_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45001";
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
        SIGNAL SQLSTATE "45002";
    END IF;

    UPDATE incidents SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE incident_id = _incident_id;
END