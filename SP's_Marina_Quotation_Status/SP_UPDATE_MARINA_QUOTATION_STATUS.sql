CREATE PROCEDURE `SP_UPDATE_MARINA_QUOTATION_STATUS`
(
    _marina_quotation_status_id INT,
    _status VARCHAR(50)
)

BEGIN

UPDATE Marina_Quotation_Status SET  
    status = _status
WHERE 
    marina_quotation_status_id = _marina_quotation_status_id;

END