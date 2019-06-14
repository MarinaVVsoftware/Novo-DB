/* SP SP_Users_GetUsers: Trae la lista de usuarios. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Users_GetUsers`()
BEGIN
    SELECT 
       	employee_id,
        rol_id,
        status_id,
        email,
        username,
        recruitment_date,
        creation_date
    FROM users 
    WHERE logical_deleted = 0;
END