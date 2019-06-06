CREATE PROCEDURE `SP_UPDATE_MARINA_QUOTATION_STATUS` (
	_id INT,
  _status_id INT
)
BEGIN
	IF NOT EXISTS(
		SELECT 1 FROM Marina_Quotations WHERE marina_quotation_id = _id
	) THEN
		SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "Quotation doesn't exists.";
    END IF;
    
    UPDATE Marina_Quotations SET
		marina_quotation_status_id = _status_id
    WHERE marina_quotation_id = _id;
END