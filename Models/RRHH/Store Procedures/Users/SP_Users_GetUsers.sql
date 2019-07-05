/* SP SP_Users_GetUsers: Trae la lista de usuarios. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Users_GetUsers`()
BEGIN
    SELECT 
       	employee_id AS employeeId,
        rol_id AS rolId,
        status_id AS statusId,
        email,
        username,
        recruitment_date AS recruitmentDate,
        creation_date AS creationDate
    FROM users 
    WHERE logical_deleted = 0;
END