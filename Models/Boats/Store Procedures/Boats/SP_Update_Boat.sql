/* SP SP_UPDATE_BOAT: Actualiza un row de Barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_BOAT`(
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
        SELECT 1 FROM Clients 
        WHERE client_id = _client_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't update boats without a client id.";
    END IF;

    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM Boats 
        WHERE name = _boat_name
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat doesn't exist";
    END IF;

    /* Guarda el id del bote en una variable */ 
    SELECT boat_id INTO @boat 
    FROM boats 
    WHERE name = _boat_name;

    /* Verifica si el bote tiene un engine con ese id. de lo contrario tira una excepción */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE client_id = _client_id 
        AND boat_id = @boat
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that boat related with that client.";
    ELSE
        UPDATE boats SET
            client_id = _client_id,
            name = _name,
            model = _model,
            loa = _loa,
            draft = _draft,
            beam = _beam
        WHERE boat_id = @boat;
    END IF;
END