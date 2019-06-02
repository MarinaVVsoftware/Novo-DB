/* SP SP_BoatElectricity_PutByElectricityId: Actualiza una relación de configuración eléctrica. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BoatElectricity_PutByElectricityId`(
    _client_id INT,
    _boat_name VARCHAR(100),    
    _boat_electricity_id INT,
    _cable_type_id INT,
    _socket_type_id INT
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
        SET MESSAGE_TEXT = "Client was not found. Can't update boat electricity without a client id valid.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't update boat electricity without a boat name valid.";
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

    /* verifica que exista la relación eléctrica. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boat_electricity 
        WHERE boat_electricity_id = _boat_electricity_id
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat electricity was not found. Can't update boat electricity.";
    END IF;

    /* verifica que exista el cable. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM cable_types 
        WHERE cable_type_id = _cable_type_id 
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Cable type was not found. Can't update boat electricity with that cable type.";
    END IF;

    /* verifica que exista el socket. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM socket_types 
        WHERE socket_type_id = _socket_type_id 
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Socket type was not found. Can't update boat electricity with that socket type.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name
    AND logical_deleted = 0;

    /* Verifica si el bote tiene una relación eléctrica con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boat_electricity 
        WHERE boat_electricity_id = _boat_electricity_id
        AND boat_id = @boat
        AND logical_deleted = 0
    ) 
    THEN
         /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat electricity related with that boat.";
    ELSE
        UPDATE boat_electricity SET
            cable_type_id = _cable_type_id,
            socket_type_id = _socket_type_id
        WHERE boat_electricity_id = _boat_electricity_id
        AND logical_deleted = 0;
    END IF;
END