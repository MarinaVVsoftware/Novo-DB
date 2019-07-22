/* SP SP_Users_DeleteByEmail: Elimina un usuario. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Users_DeleteByEmail`(
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
        SIGNAL SQLSTATE "45000";
    END IF;

    UPDATE users SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE email = _email;
END