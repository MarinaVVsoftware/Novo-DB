/* SP SP_Users_PutByName: Modifica un usuario. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Users_PutByName`(
    _old_username VARCHAR(200),
    _rol_id INT,
    _status_id INT,
    _email VARCHAR(200),
    _username VARCHAR(200),
    _recruitment_date DATETIME
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
        SIGNAL SQLSTATE "45000"
    END IF;

    /* verifica que exista el status. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM status 
        WHERE status_id = _status_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45001"
    END IF;

    /* verifica que exista el usuario. si no existe, lo crea. si existe
    realiza la actualización del usuario. */
    IF NOT EXISTS (
        SELECT 1 FROM users 
        WHERE username = _old_username
        AND logical_deleted = 0
    ) 
    THEN
        INSERT INTO users (
            rol_id,
            status_id,
            email,
            username,
            recruitment_date
        )
        VALUES (
            _rol_id,
            _status_id,
            _email,
            _username,
            _recruitment_date
        );
    ELSE
        UPDATE users SET
            username = _username,
            rol_id = _rol_id,
            status_id = _status_id,
            email = _email,
            recruitment_date = _recruitment_date
        WHERE username = _old_username;
    END IF;
END