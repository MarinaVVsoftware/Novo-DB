/* SP SP_CREATE_BOAT: Crea un row de Barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_BOAT`(
    _client_id INT,
    _name VARCHAR(50),
    _model VARCHAR(50),
    _loa DECIMAL(6,2),
    _draft DECIMAL(6,2),
    _beam DECIMAL(6,2)
)
BEGIN
    INSERT INTO boats(
        client_id,
        name,
        model,
        loa,
        draft,
        beam,
        creation_date,
    )
    VALUES(
        _client_id,
        _name,
        _model,
        _loa,
        _draft,
        _beam,
        NOW()
    );
END