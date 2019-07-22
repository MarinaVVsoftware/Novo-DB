/* SP SP_Incidents_DeleteByUser: Elimina todos los incidentes de un usuario. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Incidents_DeleteByUser`(
    _username VARCHAR(200)
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
    SELECT boat_id INTO @user 
    FROM users 
    WHERE username = _username
    AND logical_deleted = 0;


    UPDATE incidents SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE employee_id = @user;
END