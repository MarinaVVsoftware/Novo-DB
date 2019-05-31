/* SP SP_PUT_CAPTAIN_BY_BOAT: Actualiza el capitan de un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PUT_CAPTAIN_BY_BOAT`(
    _client_id INT,
    _boat_name VARCHAR(100),
    _name VARCHAR(100),
    _phone VARCHAR(15),
    _email VARCHAR(100),
    _payment_permission BOOLEAN,
    _aceptation_permission BOOLEAN
)
BEGIN

    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM clients 
        WHERE client_id = _client_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't put captain without a client id valid.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE name = _boat_name 
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat does exist. Can't put captain with no boat.";
    END IF;
    
    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    /* Verifica si el cliente tiene un bote con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND boat_id = @boat
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
    END IF;

    /* verifica que exista el capitán. si no existe, lo crea. si existe
    realiza la actualización del capitán. */
    IF NOT EXISTS (
        SELECT 1 FROM captains 
        WHERE boat_id = @boat 
        AND logical_deleted = 0
    ) 
    THEN
        INSERT INTO captains (
            boat_id, 
            name, 
            phone, 
            email, 
            payment_permission, 
            aceptation_permission
        )
        VALUES(
            @boat, 
            _name, 
            _phone, 
            _email, 
            _payment_permission, 
            _aceptation_permission
        );
    ELSE
        /* obtiene el id del capitan para modificarlo */
        SELECT captain_id INTO @captain 
        FROM captains 
        WHERE boat_id = @boat 
        AND logical_deleted = 0;

        UPDATE captains SET
            boat_id = @boat,
            name = _name,
            phone = _phone,
            email = _email,
            payment_permission = _payment_permission,
            aceptation_permission = _aceptation_permission
        WHERE captain_id = @captain;
    END IF;
END