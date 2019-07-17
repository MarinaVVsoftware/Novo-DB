/* SP SP_MarinaMooringTariff_PostTariff: Inserta una nueva tarifa. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaMooringTariff_PostTariff`(
    _marina_mooring_tariff_type_id INT,
    _name VARCHAR(100),
    _description VARCHAR(300),
    _ft_min SMALLINT,
    _ft_max SMALLINT,
    _price DECIMAL(12,4),
    _is_conditional BOOLEAN,
    _creation_responsable VARCHAR(100)
)
BEGIN
    /* verifica que exista el tipo de tarifa. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_mooring_tariff_types 
        WHERE marina_mooring_tariff_type_id = _marina_mooring_tariff_type_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Mooring tariff type status was not found. Can't post tariff without a mooring tariff type valid.";
    END IF;

    INSERT INTO marina_mooring_tariff(
        marina_mooring_tariff_type_id,
        name,
        description,
        ft_min,
        ft_max,
        price,
        is_conditional,
        creation_responsable
    )
    VALUES(
        _marina_mooring_tariff_type_id,
        _name,
        _description,
        _ft_min,
        _ft_max,
        _price,
        _is_conditional,
        _creation_responsable
    );
END