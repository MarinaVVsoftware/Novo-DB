/* SP SP_PUT_BOAT_BY_NAME: Crea o modifica un barco basado en su nombre. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PUT_BOAT_BY_NAME`(
    _client_id INT,
    _name VARCHAR(100),
    _model VARCHAR(100),
    _loa DECIMAL(6,2),
    _draft DECIMAL(6,2),
    _beam DECIMAL(6,2)
)
BEGIN

    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM Clients WHERE client_id = _client_id) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Client was not found. Can\'t read boats without a client_id.";
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Boats WHERE name = _name AND boats.logical_deleted = 0) 
    THEN
        /* Crea el barco dado que no existe */
        INSERT INTO boats(
            client_id,
            name,
            model,
            loa,
            draft,
            beam,
            creation_date
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

        /* retorna el id del row insertado */
        SELECT LAST_INSERT_ID();
    ELSE
       /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Boat does exist. Can\'t override boats.';
    END IF;
END