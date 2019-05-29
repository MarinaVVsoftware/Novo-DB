/* SP SP_CREATE_BOAT_ELECTRICITY_BY_BOATNAME: Crea una relación de configuración eléctrica con un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_BOAT_ELECTRICITY_BY_BOATNAME`(
    _boat_name VARCHAR(100),
    _cable_type_id INT,
    _socket_type_id INT
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name 
        AND boats.logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat does exist. Can't bring back electricity with no boat.";
    END IF;
    
    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    INSERT INTO boat_electricity (
        boat_id, 
        cable_type_id, 
        socket_type_id)
    VALUES (
        @boat, 
        _cable_type_id, 
        _socket_type_id
    );
END