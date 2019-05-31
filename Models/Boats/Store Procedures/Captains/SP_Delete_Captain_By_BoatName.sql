/* SP SP_DELETE_CAPTAIN_BY_BOATNAME: Elimina un capitán */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CAPTAIN_BY_BOATNAME`(
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
        SET MESSAGE_TEXT = "Client was not found. Can't delete captain without a client id valid.";
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
        SET MESSAGE_TEXT = "Boat does exist. Can't delete captain with no boat.";
    END IF;

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

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    /* verifica que exista el capitan. si no existe truena. */
    IF NOT EXISTS (
        SELECT 1 FROM captains 
        WHERE boat_id = @boat 
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Captain doesn't exist. Can't delete captain.";
    ELSE
        /* obtiene el id del capitan para modificarlo */
        SELECT captain_id INTO @captain 
        FROM captains 
        WHERE boat_id = @boat 
        AND logical_deleted = 0;

        /* Actualiza la row del capitán */
        UPDATE captains SET
            logical_deleted = 1,
            logical_deleted_date = NOW()
        WHERE captain_id = @captain;
    END IF;
END