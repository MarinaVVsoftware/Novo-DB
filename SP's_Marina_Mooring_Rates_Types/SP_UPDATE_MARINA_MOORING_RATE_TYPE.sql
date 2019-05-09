CREATE PROCEDURE `SP_UPDATE_MARINA_MOORING_RATE_TYPE`
(
    _marina_mooring_rate_type_id INT,
    _type VARCHAR(100)
)

BEGIN

UPDATE Marina_Mooring_Rates_Types SET
    type = _type
WHERE marina_mooring_rate_type_id = _marina_mooring_rate_type_id;

END