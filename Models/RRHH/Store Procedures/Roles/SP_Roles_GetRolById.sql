/* SP SP_Roles_GetRolById: Trae un rol por su id. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Roles_GetRolById`(
    _rol_id INT
)
BEGIN
    /* verifica que exista el rol. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM roles 
        WHERE rol_id = _rol_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000";
    END IF;

    SELECT 
        rol_id AS rolId,
        rank_id AS rankId,
        rol_name AS rolName,
        permissions,
        creation_date AS creationDate
    FROM roles
    WHERE rol_id = _rol_id;
END