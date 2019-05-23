/* SP SP_READ_BOAT_ELECTRICITY_BY_BOAT: Trae todas las relaciones eléctricas de un solo bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOAT_ELECTRICITY_BY_BOAT`(
    _boat_id INT
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM Boats WHERE boat_id = _boat_id AND boats.logical_deleted = 0) THEN
         /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Boat does exist. Can't bring back electricity with no boat.";
    END IF;
    
    /* obtiene todas las relaciones de un barco */
    SELECT
        _boat_electricity.boat_electricity_id AS boat_electricity_id,
        _boat_electricity.boat_id AS boat_id,
        _cable_types.cable_type_id AS cable_type_id,
        _cable_types.cable_type AS cable_type,
        _cable_types.voltage AS cable_voltage,
        _cable_types.price AS cable_price,
        _cable_types.description AS cable_description,
        _socket_types.socket_type_id AS socket_type_id,
        _socket_types.socket_type AS socket_type,
        _socket_types.description AS socket_description
    FROM boat_electricity AS _boat_electricity
    LEFT OUTER JOIN cable_types AS _cable_types
    ON (_cable_types.cable_type_id = _boat_electricity.cable_type_id 
        AND _boat_electricity.logical_deleted != 1)
    LEFT OUTER JOIN socket_types AS _socket_types
    ON (_socket_types.socket_type_id = _boat_electricity.cable_type_id 
        AND _boat_electricity.logical_deleted != 1)
    WHERE boat_id = _boat_id
    AND _boat_electricity.logical_deleted = 0;
END