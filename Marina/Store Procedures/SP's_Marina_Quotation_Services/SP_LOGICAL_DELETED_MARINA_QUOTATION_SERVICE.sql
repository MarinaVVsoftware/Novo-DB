CREATE PROCEDURE `SP_LOGICAL_DELETED_MARINA_QUOTATION_SERVICE`
(
    _marina_quotation_service_id INT,
    _logical_deleted BOOLEAN
)

BEGIN

UPDATE Marina_Quotation_Services SET
    logical_deleted = _logical_deleted,
    logical_deleted_date = NOW()
WHERE marina_quotation_service_id = _marina_quotation_service_id;

END