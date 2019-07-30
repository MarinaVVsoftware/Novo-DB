/* SP SP_Captains_DeleteByBoat: Elimina un capitán */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Captains_DeleteByBoat`(
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
        SIGNAL SQLSTATE "45000";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE name = _boat_name
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
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45002";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;
    
    /* obtiene el id del capitan para modificarlo */
    SELECT captain_id INTO @captain 
    FROM captains 
    WHERE boat_id = @boat 
    AND logical_deleted = 0;

    /* Actualiza la row del capitán */
    UPDATE captains SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE captain_id = @captain
    AND logical_deleted = 0;
END