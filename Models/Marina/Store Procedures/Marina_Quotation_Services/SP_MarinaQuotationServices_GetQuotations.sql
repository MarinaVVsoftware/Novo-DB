/* SP SP_MarinaQuotationServices_GetQuotations: Trae la lista cotizaciones
de servicios adicionales de marina húmeda. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationServices_GetQuotations`()
BEGIN
    SELECT
        marina_quotation_service_id AS marinaQuotationServiceId,
        boat_id AS boatId,
        marina_quotation_service_type_id AS marinaQuotationServiceTypeId,
        done_status AS doneStatus,
        quantity,
        subtotal,
        tax
        total,
        creation_date AS creationDate
    FROM marina_quotation_services
    ORDER BY marina_quotation_service_id ASC;
END