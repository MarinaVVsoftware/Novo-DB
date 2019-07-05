/* SP SP_Roles_GetRoles: Trae la lista de roles. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Roles_GetRoles`()
BEGIN
    SELECT 
        rol_id AS rolId,
        rank_id AS rankId,
        rol_name AS rolName,
        permissions,
        creation_date AS creationDate
    FROM roles 
    WHERE logical_deleted = 0;
END