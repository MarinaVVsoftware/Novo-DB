/* SP SP_Users_DeleteByName: Elimina un usuario. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Users_DeleteByName`(
    _username VARCHAR(200)
)
BEGIN
    /* verifica que exista el user. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM users 
        WHERE username = _username
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "User was not found. Can't delete user without an username valid.";
    END IF;

    UPDATE users SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE username = _username;
END