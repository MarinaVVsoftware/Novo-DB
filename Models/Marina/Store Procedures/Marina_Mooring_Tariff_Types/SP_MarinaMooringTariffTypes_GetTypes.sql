/* SP SP_MarinaMooringTariffTypes_GetTypes: Trae la lista de tipos de tarifas de amarre */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaMooringTariffTypes_GetTypes`()
BEGIN
    SELECT
        marina_mooring_tariff_type_id AS marinaMooringTariffTypeId,
        tariff_type AS tariffType
    FROM marina_mooring_tariff_types
    ORDER BY marina_mooring_tariff_type_id ASC;
END