/* SP SP_DELETE_BOAT: Elimina un barco */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT`(
    _client_id INT, 
    _name varchar(100)
)
BEGIN

    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM Clients WHERE client_id = _client_id) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't read boats without a client id.";
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _name 
        AND boats.logical_deleted = 0
    )
    THEN
       /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't delete boats if not exist.";
    ELSE
        /* Guarda el id del bote en una variable */
        SELECT boat_id INTO @boat 
        FROM boats 
        WHERE name = _name;
        
        /* Actualiza la row del bote */
        UPDATE boats SET
            logical_deleted = 1,
            logical_deleted_date = NOW()
        WHERE boat_id = @boat;
            
        /* retorna el id del row modificado */
        SELECT boat_id 
        FROM boats 
        WHERE name = _name;
    END IF;
END