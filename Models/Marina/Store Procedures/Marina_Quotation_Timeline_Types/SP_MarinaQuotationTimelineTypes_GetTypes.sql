/* SP SP_MarinaQuotationTimelineTypes_GetTypes: Trae los 
tipos de eventos en el timeline de cotizaciones. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationTimelineTypes_GetTypes`()
BEGIN
    SELECT
        marina_quotation_timeline_type_id,
        timeline_type
    FROM marina_quotation_timeline_types 
    WHERE logical_deleted = 0;
END