/* SP SP_Boats_PatchBoat: Actualiza un Barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Boats_PatchBoat`(
    _client_id INT,
    _boat_name VARCHAR(100),
    _name VARCHAR(100),
    _model VARCHAR(100),
    _loa DECIMAL(6,2),
    _draft DECIMAL(6,2),
    _beam DECIMAL(6,2)
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
        SET MESSAGE_TEXT = "Client was not found. Can't update boat without a client id.";
    END IF;

    //* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE name = _boat_name
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't update boat without a boat name valid.";
    END IF;

    /* Verifica si el bote tiene un engine con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND name = _boat_name
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
    END IF;

    /* Guarda el id del bote en una variable */ 
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name
    AND logical_deleted = 0;

    UPDATE boats SET
        client_id = _client_id,
        name = _name,
        model = _model,
        loa = _loa,
        draft = _draft,
        beam = _beam
    WHERE boat_id = @boat
    AND logical_deleted = 0;
END