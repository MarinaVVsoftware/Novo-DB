/* SP SP_Users_GetUserByName: Trae la lista de usuarios. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Users_GetUserByName`(
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
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "User was not found. Can't get user without an username valid.";
    END IF;

    SELECT 
       	employee_id AS employeeId,
        status_id AS statusId,
        email,
        username,
        recruitment_date AS recruitmentDate,
        creation_date AS creationDate
    FROM users 
    WHERE username = _username;
END