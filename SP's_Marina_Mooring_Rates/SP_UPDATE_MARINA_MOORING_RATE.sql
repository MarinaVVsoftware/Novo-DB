CREATE PROCEDURE `SP_UPDATE_MARINA_MOORING_RATE`
(
    _marina_mooring_rate_id INT,
    _marina_mooring_rate_type_id INT,
    _name VARCHAR(100),
    _description varchar(300),
    _ft_min SMALLINT,
    _ft_max SMALLINT,
    _price FLOAT(16,8)
)

BEGIN

UPDATE Marina_Mooring_Rates SET
    marina_mooring_rate_type_id = _marina_mooring_rate_type_id,
    name = _name,
    description = _description,
    ft_min = _ft_min,
    ft_max = _ft_max,
    price = _price
WHERE marina_mooring_rate_id  = _marina_mooring_rate_id;

END