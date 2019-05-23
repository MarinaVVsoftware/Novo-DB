CREATE PROCEDURE `SP_LOGICAL_DELETED_MARINA_QUOTATION`
(
	_marina_quotation_id INT,
    _logical_deleted BOOLEAN
)
BEGIN

UPDATE Marina_Quotations SET  
    logical_deleted = _logical_deleted,
    logical_deleted_date = NOW()
    
WHERE marina_quotation_id = _marina_quotation_id;

END