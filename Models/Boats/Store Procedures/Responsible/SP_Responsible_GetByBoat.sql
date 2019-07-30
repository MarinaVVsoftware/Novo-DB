/* SP SP_Responsible_GetByBoat: Trae el responsable de un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Responsible_GetByBoat`(
    _client_id INT,
    _boat_name VARCHAR(100)
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

    SELECT 
        responsable_id AS responsableId,
        boat_id AS responsableId,
        name,
        phone,
        email,
        payment_permission AS emailPermission,
        aceptation_permission AS aceptationPermission
    FROM responsible 
    WHERE boat_id = @boat
    AND logical_deleted = 0;
END