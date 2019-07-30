/* SP SP_Responsible_PutByBoat: Actualiza el responsable de un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Responsible_PutByBoat`(
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

    /* verifica que exista el responsable. si no existe
    lo crea, de lo contrario lo actualiza. */
    IF NOT EXISTS (
        SELECT 1 FROM responsible 
        WHERE boat_id = @boat 
        AND logical_deleted = 0
    )
    THEN
        INSERT INTO responsible (
            boat_id, 
            name, 
            phone, 
            email, 
            payment_permission, 
            aceptation_permission
        )
        VALUES (
            @boat, 
            _name, 
            _phone, 
            _email, 
            _payment_permission,
            _aceptation_permission
        );
    ELSE
        /* obtiene el id del responsable para modificarlo */
        SELECT responsable_id INTO @responsable 
        FROM responsible 
        WHERE boat_id = @boat 
        AND logical_deleted = 0;

        /* Actualiza el bote */
        UPDATE responsible SET
            boat_id = @boat,
            name = _name,
            phone = _phone,
            email = _email,
            payment_permission = _payment_permission,
            aceptation_permission = _aceptation_permission
        WHERE responsable_id = @responsable
        AND logical_deleted = 0;
    END IF;
END