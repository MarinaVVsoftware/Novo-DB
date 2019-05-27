/* SP SP_READ_ENGINES_BY_BOAT: Trae los motores de un barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ENGINES_BY_BOAT`(
    _boat_name VARCHAR(100)
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM Boats WHERE name = _boat_name) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Boat doesn\'t exist.';
    ELSE
        /* Guarda el id del bote en una variable */
        SELECT boat_id INTO @boat FROM boats WHERE name = _boat_name;

        /* obtiene todos los engines de un bote. */
        SELECT 
            engine_id,
            boat_id,
            model,
            brand
        FROM engines 
        WHERE engines.boat_id = @boat
        AND engines.logical_deleted = 0;
    END IF;
END