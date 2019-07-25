/* SP SP_MarinaQuotationElectricity_GetElectricity: Trae una cotización eléctrica por su id. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationElectricity_GetElectricity`(
    _marina_quotation_id INT
)
BEGIN
    /* verifica que exista la cotización. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotations 
        WHERE marina_quotation_id = _marina_quotation_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
    END IF;

    SELECT
        marina_quotation_electricity_id AS marinaQuotationElectricityId,
        marina_quotation_id AS marinaQuotationId,
        electricity_tariff AS electricityTariff,
        total_days AS totalDays,
        discount_electricity_percentage AS discountElectricityPercentage,
        currency_amount AS currencyAmount,
        subtotal,
        tax,
        total,
    FROM marina_quotation_electricity 
    WHERE marina_quotation_id = _marina_quotation_id;
END