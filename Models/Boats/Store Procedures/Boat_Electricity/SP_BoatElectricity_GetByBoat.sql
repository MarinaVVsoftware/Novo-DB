/* SP SP_BoatElectricity_GetByBoat: Trae todas las relaciones eléctricas de un solo bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BoatElectricity_GetByBoat`(
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
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't read boat electricity without a client id valid.";
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
        SET MESSAGE_TEXT = "Boat was not found. Can't read boat electricity without a boat name valid.";
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
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
    END IF;
    
    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats
    WHERE name = _boat_name
    AND logical_deleted = 0;

    /* obtiene todas las relaciones de un barco */
    SELECT
        _boat_electricity.boat_electricity_id AS boatElectricityId,
        _boat_electricity.boat_id AS boatId,
        _cable_types.cable_type_id AS cableTypeId,
        _cable_types.cable_type AS cableType,
        _cable_types.voltage AS cableVoltage,
        _cable_types.price AS cablePrice,
        _cable_types.description AS cableDescription,
        _socket_types.socket_type_id AS socketTypeId,
        _socket_types.socket_type AS socketType,
        _socket_types.description AS socketDescription
    FROM boat_electricity AS _boat_electricity
    LEFT OUTER JOIN cable_types AS _cable_types
    ON (_cable_types.cable_type_id = _boat_electricity.cable_type_id 
        AND _boat_electricity.logical_deleted = 0)
    LEFT OUTER JOIN socket_types AS _socket_types
    ON (_socket_types.socket_type_id = _boat_electricity.socket_type_id 
        AND _boat_electricity.logical_deleted = 0)
    WHERE (boat_id = @boat
        AND _boat_electricity.logical_deleted = 0)
    ORDER BY _cable_types.cable_type_id ASC;
END