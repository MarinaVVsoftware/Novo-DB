/* SP SP_Roles_DeleteByName: Elimina un rol. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Roles_DeleteByName`(
	_rol_name VARCHAR(50)
)
BEGIN
    /* verifica que exista el rol. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM roles 
        WHERE rol_name = _rol_name
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Rol was not found. Can't delete rol if doesn't exists.";
    END IF;

    UPDATE roles SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE rol_name = _rol_name;
END