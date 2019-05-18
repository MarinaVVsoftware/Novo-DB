/* SP SP_READ_BOATS_BY_CLIENT: Trae todos los barcos asociados a un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOATS_BY_CLIENT`(
    _client_id INT
)
BEGIN
    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM Clients WHERE client_id = _client_id) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Client was not found. Can\'t read boats without a client_id.';
    END IF;
    
    SELECT * FROM Boats
    LEFT OUTER JOIN Captains 
    ON (captains.boat_id = boats.boat_id)
    LEFT OUTER JOIN Responsible 
    ON (responsible.boat_id = boats.boat_id) 
    WHERE (boats.client_id = 1)
    AND (boats.logical_deleted = 0);
END