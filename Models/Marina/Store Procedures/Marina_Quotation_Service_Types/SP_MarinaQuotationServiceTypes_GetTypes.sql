/* SP SP_MarinaQuotationServiceTypes_GetTypes: Trae la lista de servicios 
adicionales de marina húmeda. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationServiceTypes_GetTypes`()
BEGIN
    SELECT
        marina_quotation_service_type_id AS marinaQuotationServiceTypeId,
        service,
        price
    FROM marina_quotation_service_types
    WHERE logical_deleted = 0
    ORDER BY marina_quotation_service_type_id ASC;
END