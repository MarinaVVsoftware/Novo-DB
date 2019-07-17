/* SP SP_MarinaQuotations_GetQuotationById: Trae una cotización por su id. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotations_GetQuotationById`(
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
        SET MESSAGE_TEXT = "Quotation was not found. Can't get quotation without a marina quotation id valid.";
    END IF;

    SELECT
        marina_quotation_id AS marinaQuotationId,
        boat_id AS boatId,
        marina_quotation_status_id AS marinaQuotationStatusId,
        marina_mooring_tariff_id AS marinaMooringTariffId,
        arrival_date AS arrivalDate,
        departure_date AS departureDate,
        mooring_tariff AS mooringTariff,
        loa,
        days_stay AS daysStay, 
        discount_stay_percentage AS discountStayPercentage,
        currency_amount AS currencyAmount,
        tax,
        subtotal,
        total,
        monthly_quotation AS monthlyQuotation,
        annual_quotation AS annualQuotation,
        semiannual_quotation AS semiannualQuotation, 
        group_quotation AS groupQuotation,
        creation_responsable AS creationResponsable
    FROM marina_quotations 
    WHERE marina_quotation_id = _marina_quotation_id;
END