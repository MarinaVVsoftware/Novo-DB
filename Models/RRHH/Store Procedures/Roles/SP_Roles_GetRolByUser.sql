/* SP SP_Roles_GetRolByUser: Trae la lista de roles. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Roles_GetRolByUser`(
    _rol_id INT
)
BEGIN
    SELECT 
        rol_id AS rolId,
        rank_id AS rankId,
        rol_name AS rolName,
        permissions,
        creation_date AS creationDate
    FROM roles
    WHERE rol_id = _rol_id;
END