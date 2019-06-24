/* SP SP_Clients_PostClient: Crea un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Clients_PostClient`(
    _status_id INT,
    _name VARCHAR(200),
    _email VARCHAR(200),
    _phone VARCHAR(20),
    _address VARCHAR(300)
)
BEGIN
    /* verifica que exista el status. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM status 
        WHERE status_id = _status_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Status doesn't exist. Can't put client.";
    END IF;

    /* verifica que exista el usuario. si no existe, lo crea. Si existe arroja
    un error dado que no puede haber duplicidad de clientes. */
    IF NOT EXISTS (
        SELECT 1 FROM users 
        WHERE email = _email
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client already exists. Can't create two clients with same email.";
    ELSE
        INSERT INTO clients (
            status_id,
            name,
            email,
            phone,
            address
        )
        VALUES (
            _status_id,
            _name,
            _email,
            _phone,
            _address
        );
    END IF;
END