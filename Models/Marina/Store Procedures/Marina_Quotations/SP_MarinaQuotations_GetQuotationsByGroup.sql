CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotations_GetQuotationsByGroup`(
    _filterBy VARCHAR(30)
)
BEGIN
    SELECT
        _marina_quotations.marina_quotation_id AS marinaQuotationId, 
        _clients.client_id AS clientId,
        _clients.name AS clientName,
        _marina_quotations.boat_id AS boatId,
        _boats.name AS boatName,
        _marina_quotations.marina_quotation_status_id AS marinaQuotationStatusId,
        _marina_quotations.marina_mooring_tariff_id AS marinaMooringTariffId,
        _marina_quotations.arrival_date AS arrivalDate,
        _marina_quotations.departure_date AS departureDate,
        _marina_quotations.days_stay AS daysStay,
        _marina_quotations.loa AS loa,
        _marina_quotations.discount_stay_percentage AS discountStayPercentage,
        _marina_quotations.tax,
        _marina_quotations.subtotal,
        _marina_quotations.total,
        _marina_quotations.monthly_quotation AS monthlyQuotation,
        _marina_quotations.annual_quotation AS annualQuotation,
        _marina_quotations.semiannual_quotation AS semiannualQuotation,
        _marina_quotations.group_quotation AS groupQuotation,
        _marina_quotations.creation_responsable AS creationResponsable,
        _marina_quotations.creation_date AS creationDate
    FROM marina_quotations AS _marina_quotations
    INNER JOIN boats AS _boats 
        ON _marina_quotations.boat_id = _boats.boat_id
    INNER JOIN clients AS _clients 
        ON _boats.client_id = _clients.client_id
    WHERE FIND_IN_SET(_marina_quotations.marina_quotation_status_id, _filterBy) > 0;
END