/* SP SP_MarinaMooringTariff_GetTariffByType: Trae todas las tarifas de un tipo. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaMooringTariff_GetTariffByType`(
    _marina_mooring_tariff_type_id INT
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
        SET MESSAGE_TEXT = "Mooring tariff type status was not found. Can't get tariff without a mooring tariff type valid.";
    END IF;

    SELECT
        marina_mooring_tariff_id AS marinaMooringTariffId,
        marina_mooring_tariff_type_id AS marinaMooringTariffTypeId,
        name,
        description,
        ft_min AS ftMin,
        ft_max AS ftMax,
        price,
        is_conditional AS isConditional,
        creation_responsable AS creationResponsable,
        creation_date AS creationDate
    FROM marina_mooring_tariff
    WHERE marina_mooring_tariff_type_id = _marina_mooring_tariff_type_id
    AND logical_deleted = 0;
END