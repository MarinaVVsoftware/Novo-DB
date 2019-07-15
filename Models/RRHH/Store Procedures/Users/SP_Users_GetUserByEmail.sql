/* SP SP_Users_GetUserByEmail: Trae la lista de usuarios. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Users_GetUserByEmail`(
    _email VARCHAR(200)
)
BEGIN
    /* verifica que exista el user. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM users 
        WHERE email = _email
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "User was not found. Can't get user without an email valid.";
    END IF;

    SELECT 
       	employee_id AS employeeId,
        rol_id AS rolId,
        status_id AS statusId,
        email,
        username,
        recruitment_date AS recruitmentDate,
        creation_date AS creationDate
    FROM users 
    WHERE email = _email;
END