/* SP SP_Roles_PutRolByName: Modifica un rol. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Roles_PutRolByName`(
    _old_rol_name VARCHAR(50),
    _rank_id INT,
	_rol_name VARCHAR(50),
	_permissions LONGTEXT
)
BEGIN
    /* verifica que exista el rank a modificar. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM ranks 
        WHERE rank_id = _rank_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000";
    END IF;

    /* verifica que exista el rol. si no existe, lo crea. si existe
    realiza la actualización del rol. */
    IF NOT EXISTS (
        SELECT 1 FROM roles 
        WHERE rol_name = _old_rol_name
        AND logical_deleted = 0
    )
    THEN
        INSERT INTO roles (
            rank_id,
            rol_name,
            permissions
        )
        values (
            _rank_id,
            _rol_name,
            _permissions
        );
    ELSE

        UPDATE roles SET
            rank_id = _rank_id,
            rol_name = _rol_name,
            permissions = _permissions
        WHERE rol_name = _old_rol_name;
    END IF;
END