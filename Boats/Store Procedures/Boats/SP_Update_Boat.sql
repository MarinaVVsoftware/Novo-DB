/* SP SP_UPDATE_BOAT: Actualiza un row de Barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_BOAT`(
    _boat_id INT,
    _client_id INT,
    _name VARCHAR(50),
    _model VARCHAR(50),
    _loa DECIMAL(6,2),
    _draft DECIMAL(6,2),
    _beam DECIMAL(6,2)
)
BEGIN
    UPDATE boats SET
        client_id = _client_id,
        name = _name,
        model = _model,
        loa = _loa,
        draft = _draft,
        beam = _beam
    WHERE 
        boat_id = _boat_id;
END