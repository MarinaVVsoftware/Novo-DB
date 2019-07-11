/* SP SP_Boats_GetByClient: Trae todos los barcos asociados a un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Boats_GetByClient`(
    _client_id INT
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
        SET MESSAGE_TEXT = "Client was not found. Can't read boats without a client id.";
    END IF;
    
    /* Cambia los nombres de las columnas para que no colisionen
    entre ellas. Están nombrados igual */
    SELECT
        _boats.boat_id AS boatId,
        _boats.client_id AS clientId,
        _boats.name AS boatName,
        _boats.model AS model,
        _boats.loa AS loa,
        _boats.draft AS draft,
        _boats.beam AS beam,
        _captains.captain_id AS captainId,
        _captains.boat_id AS captainBoatId,
        _captains.name AS captainName,
        _captains.phone AS captainPhone,
        _captains.email AS captainEmail,
        _captains.payment_permission AS captainPaymentPermission,
        _captains.aceptation_permission AS captainAceptationPermission,
        _responsible.responsable_id AS responsableId,
        _responsible.boat_id AS responsibleBoatId,
        _responsible.name AS responsibleName,
        _responsible.phone AS responsiblePhone,
        _responsible.email AS responsibleEmail,
        _responsible.payment_permission AS responsiblePaymentPermission,
        _responsible.aceptation_permission AS responsibleAceptationPermission
    FROM boats AS _boats
    LEFT OUTER JOIN captains AS _captains
    ON (_captains.boat_id = _boats.boat_id AND _captains.logical_deleted = 0)
    LEFT OUTER JOIN responsible AS _responsible
    ON (_responsible.boat_id = _boats.boat_id  AND _responsible.logical_deleted = 0) 
    WHERE (_boats.client_id = _client_id)
    AND (_boats.logical_deleted = 0)
    ORDER BY _boats.boat_id ASC;
END