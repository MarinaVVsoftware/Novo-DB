/* SP SP_MarinaMooringTariff_GetTariff: Trae la lista de tarifas. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaMooringTariff_GetTariff`()
BEGIN
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
    WHERE logical_deleted = 0;
END