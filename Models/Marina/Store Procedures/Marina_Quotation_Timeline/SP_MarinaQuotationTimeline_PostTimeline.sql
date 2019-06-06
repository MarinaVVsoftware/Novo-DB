/* SP SP_MarinaQuotationTimeline_PostTimeline: Inserta un nuevo evento de timeline. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationTimeline_PostTimeline`(
    _marina_quotation_id INT,
    _marina_quotation_timeline_type_id INT,
    _title VARCHAR(200),
    _description VARCHAR(300),
    _creation_responsible VARCHAR(200)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotations 
        WHERE marina_quotation_id = _marina_quotation_id 
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that marina quotation. Can't insert timeline without a marina quotation valid.";
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM marina_quotation_timeline_types 
        WHERE marina_quotation_timeline_type_id = _marina_quotation_timeline_type_id 
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Doesn't exist that timeline type. Can't insert timeline without a timeline type valid.";
    END IF;


    INSERT INTO marina_quotation_timeline (
        marina_quotation_id, 
        marina_quotation_timeline_type_id, 
        title,
        description,
        creation_responsible
    )
    VALUES (
        _marina_quotation_id, 
        _marina_quotation_timeline_type_id, 
        _title,
        _description,
        _creation_responsible
    );
END