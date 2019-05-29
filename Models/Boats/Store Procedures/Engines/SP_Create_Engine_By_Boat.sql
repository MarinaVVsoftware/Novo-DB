/* SP SP_CREATE_ENGINE_BY_BOAT: Crea un engine a partir del nombre de un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_ENGINE_BY_BOAT`(
    _boat_name varchar(100),
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
        SET MESSAGE_TEXT = "Boat doesn't exist.";
    ELSE
        /* Guarda el id del bote en una variable */
        SELECT boat_id INTO @boat 
        FROM boats 
        WHERE name = _boat_name;

        INSERT INTO engines (boat_id, model, brand)
        VALUES(@boat, _model, _brand);

        /* retorna el id del row insertado */
        SELECT LAST_INSERT_ID();
    END IF;
END