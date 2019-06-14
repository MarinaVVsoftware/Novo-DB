/* SP SP_Incidents_DeleteById: Elimina un incidente por su id. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_DeleteById`(
    _incident_id INT
)
BEGIN
    /* verifica que exista el user. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM incidents 
        WHERE incident_id = _incident_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Incident was not found. Can't delete incident if doesn't exists.";
    END IF;

    UPDATE incidents SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE incident_id = _incident_id;
END