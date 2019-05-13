CREATE PROCEDURE `SP_LOGICAL_DELETED_MARINA_MOORING_RATE`
(
	_marina_mooring_rate_id INT,
    _logical_deleted BOOLEAN
)
BEGIN

UPDATE Marina_Mooring_Rates SET  
    logical_deleted = _logical_deleted,
    logical_deleted_date = NOW()
    
WHERE marina_mooring_rate_id  = _marina_mooring_rate_id;

END