/* SP SP_READ_BOATS_BY_CLIENT: Trae todos los barcos asociados a un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOATS_BY_CLIENT`(
    _client_id INT
)
BEGIN
    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM clients WHERE client_id = _client_id) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Client was not found. Can\'t read boats without a client_id.";
    END IF;
    
    /* Cambia los nombres de las columnas para que no colisionen
    entre ellas. Están nombrados igual */
    SELECT
        _boats.boat_id AS boat_id,
        _boats.client_id AS client_id,
        _boats.name AS boat_name,
        _boats.model AS model,
        _boats.loa AS loa,
        _boats.draft AS draft,
        _boats.beam AS beam,
        _captains.captain_id AS captain_id,
        _captains.boat_id AS captain_boat_id,
        _captains.name AS captain_name,
        _captains.phone AS captain_phone,
        _captains.email AS captain_email,
        _captains.payment_permission AS captain_payment_permission,
        _captains.aceptation_permission AS captain_aceptation_permission,
        _responsible.responsable_id AS responsable_id,
        _responsible.boat_id AS responsible_boat_id,
        _responsible.name AS responsible_name,
        _responsible.phone AS responsible_phone,
        _responsible.email AS responsible_email,
        _responsible.payment_permission AS responsible_payment_permission,
        _responsible.aceptation_permission AS responsible_aceptation_permission
    FROM Boats AS _boats
    LEFT OUTER JOIN Captains AS _captains
    ON (_captains.boat_id = _boats.boat_id AND _captains.logical_deleted = 0)
    LEFT OUTER JOIN Responsible AS _responsible
    ON (_responsible.boat_id = _boats.boat_id  AND _responsible.logical_deleted = 0) 
    WHERE (_boats.client_id = _client_id)
    AND (_boats.logical_deleted = 0);
END