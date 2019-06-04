/* SP SP_Responsible_DeleteByBoat: Elimina un responsable */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Responsible_DeleteByBoat`(
    _client_id INT,
    _boat_name VARCHAR(100)
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
        SET MESSAGE_TEXT = "Client was not found. Can't delete responsable without a client id valid.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE name = _boat_name 
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat does exist. Can't delete responsable with no boat.";
    END IF;

    /* Verifica si el cliente tiene un bote con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND name = _boat_name
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    /* obtiene el id del responsable para modificarlo */
    SELECT responsable_id INTO @responsable 
    FROM responsible 
    WHERE boat_id = @boat 
    AND logical_deleted = 0;

    UPDATE responsible SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE responsable_id = @responsable
    AND logical_deleted = 0;
END