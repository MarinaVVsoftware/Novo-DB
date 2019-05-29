CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_MARINA_MOORING_RATE`
(
    _marina_mooring_rate_id INT,
    _marina_mooring_rate_type_id INT,
    _name VARCHAR(100),
    _description varchar(300),
    _ft_min SMALLINT,
    _ft_max SMALLINT,
    _price DECIMAL(12,4),
    _is_conditional BOOLEAN,
    _creation_responsable VARCHAR(100),
    _creation_date DATETIME
)

BEGIN

UPDATE Marina_Mooring_Rates SET
    marina_mooring_rate_type_id = _marina_mooring_rate_type_id,
    name = _name,
    description = _description,
    ft_min = _ft_min,
    ft_max = _ft_max,
    price = _price,
    is_conditional = _is_conditional,
    creation_responsable = _creation_responsable,
    creation_date = _creation_date
WHERE marina_mooring_rate_id  = _marina_mooring_rate_id;

END