/* SP SP_MarinaMooringTariff_PutTariff: Modifica una nueva tarifa. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaMooringTariff_PutTariff`(
    _marina_mooring_tariff_id INT,
    _marina_mooring_tariff_type_id INT,
    _name VARCHAR(100),
    _description VARCHAR(300),
    _ft_min SMALLINT,
    _ft_max SMALLINT,
    _price DECIMAL(12,4),
    _is_conditional BOOLEAN
)
BEGIN
    /* verifica que exista la tarifa a modificar. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_mooring_tariff 
        WHERE marina_mooring_tariff_id = _marina_mooring_tariff_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Mooring tariff type status was not found. Can't post tariff without a mooring tariff type valid.";
    END IF;

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

    UPDATE marina_mooring_tariff SET 
        marina_mooring_tariff_type_id = _marina_mooring_tariff_type_id,
        name = _name,
        description = _description,
        ft_min = _ft_min,
        ft_max = _ft_max,
        price = _price,
        is_conditional = _is_conditional
    WHERE marina_mooring_tariff_id = _marina_mooring_tariff_id;

END