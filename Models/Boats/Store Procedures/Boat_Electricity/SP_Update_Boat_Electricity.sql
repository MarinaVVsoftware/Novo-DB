/* SP SP_UPDATE_BOAT_ELECTRICITY: Actualiza una relación de configuración eléctrica. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_BOAT_ELECTRICITY`(
    _boat_name VARCHAR(100),    
    _boat_electricity_id INT,
    _cable_type_id INT,
    _socket_type_id INT
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM Boats WHERE name = _boat_name) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Boat was not found. Can\'t update BoatElectricity without a boat_name valid.";
    END IF;

    /* verifica que exista la relación eléctrica. de lo contrario tira una excepción. */
      IF NOT EXISTS (SELECT 1 FROM boat_electricity WHERE boat_electricity_id = _boat_electricity_id) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "BoatElectricity was not found. Can\'t update BoatElectricity.";
    END IF;

    /* verifica que exista el socket. de lo contrario tira una excepción. */
      IF NOT EXISTS (SELECT 1 FROM cable_types WHERE cable_type_id = _cable_type_id AND logical_deleted = 0) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "CableType was not found. Can\'t update BoatElectricity with that CableType.";
    END IF;

    /* verifica que exista el socket. de lo contrario tira una excepción. */
      IF NOT EXISTS (SELECT 1 FROM socket_types WHERE socket_type_id = _socket_type_id AND logical_deleted = 0) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "SocketType was not found. Can\'t update BoatElectricity with that SocketType.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat FROM boats WHERE name = _boat_name;

    /* Verifica si el bote tiene una relación eléctrica con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boat_electricity 
        WHERE boat_electricity_id = _boat_electricity_id 
        AND boat_id = @boat ) 
    THEN
         /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Doesn't exist that BoatElectricity related with that boat.";
    ELSE
        UPDATE boat_electricity SET
            cable_type_id = _cable_type_id,
            socket_type_id = _socket_type_id
        WHERE 
            boat_electricity_id = _boat_electricity_id;
    END IF;




END