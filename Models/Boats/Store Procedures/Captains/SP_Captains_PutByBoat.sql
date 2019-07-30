/* SP SP_Captains_PutByBoat: Actualiza el capitan de un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Captains_PutByBoat`(
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
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE name = _boat_name 
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45001";
    END IF;

    /* Verifica si el cliente tiene un bote con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND name = _boat_name
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45002";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name
    AND logical_deleted = 0;

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
        WHERE captain_id = @captain
        AND logical_deleted = 0;
    END IF;
END