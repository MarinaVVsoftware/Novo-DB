/* SP SP_UPDATE_ENGINE_BY_ID: Actualiza un motor a partir de su id. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ENGINE_BY_ID`(
    _boat_name VARCHAR(100),
    _engine_id INT,
    _model VARCHAR(100),
    _brand VARCHAR(100)
    )
BEGIN

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't update engine without a boat name valid.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM engines 
        WHERE engine_id = _engine_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Engine was not found. Can't update engine.";
    END IF;

    /* Guarda el id del bote en una variable */
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    /* Verifica si el bote tiene un engine con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM engines 
        WHERE engine_id = _engine_id 
        AND boat_id = @boat
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that engine related with that boat.";
    ELSE
        UPDATE engines SET
            model = _model,
            brand = _brand
        WHERE engine_id = _engine_id;
    END IF;
END