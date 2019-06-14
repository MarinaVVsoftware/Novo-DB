/* SP SP_Roles_GetRoles: Trae la lista de roles. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Roles_GetRoles`()
BEGIN
    SELECT 
        rol_id,
        rank_id,
        rol_name,
        permissions,
        creation_date
    FROM roles 
    WHERE logical_deleted = 0;
END