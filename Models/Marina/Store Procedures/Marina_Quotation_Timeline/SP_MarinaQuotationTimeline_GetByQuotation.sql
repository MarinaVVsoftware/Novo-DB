/* SP SP_MarinaQuotationTimeline_GetByQuotation: Trae todos los eventos de una cotización. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationTimeline_GetByQuotation`(
    _marina_quotation_id INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotations 
        WHERE marina_quotation_id = _marina_quotation_id 
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that marina quotation. Can't get quotation timeline without a marina quotation valid.";
    END IF;

    /* Busca todos los eventos de timeline de una cotización y los ordena por fecha de creación.*/
    SELECT
        _quotation_timeline.marina_quotation_id,
        _quotation_timeline.marina_quotation_timeline_id,
        _timeline_types.timeline_type,
        _quotation_timeline.title,
        _quotation_timeline.description,
        _quotation_timeline.creation_responsible,
        _quotation_timeline.creation_date
    FROM marina_quotation_timeline AS _quotation_timeline
    LEFT OUTER JOIN marina_quotation_timeline_types AS _timeline_types
    ON (_timeline_types.marina_quotation_timeline_type_id = _quotation_timeline.marina_quotation_timeline_id 
        AND _timeline_types.logical_deleted = 0)
    WHERE _quotation_timeline.marina_quotation_id = _marina_quotation_id
    ORDER BY _quotation_timeline.creation_date ASC;
END