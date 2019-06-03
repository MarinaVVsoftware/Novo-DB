/* SP SP_MarinaQuotationTimelineTypes_PostType: Crea un tipo de evento de timeline. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationTimelineTypes_PostType`(
    _timeline_type VARCHAR(50)
)
BEGIN
    INSERT INTO marina_quotation_timeline_types (
        timeline_type
    )
    VALUES (
        _timeline_type 
    );
END