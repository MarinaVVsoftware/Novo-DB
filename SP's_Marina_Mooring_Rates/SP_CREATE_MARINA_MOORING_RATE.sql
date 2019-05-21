CREATE PROCEDURE `SP_CREATE_MARINA_MOORING_RATE`
(
    _marina_mooring_rate_type_id INT,
    _name VARCHAR(100),
    _description varchar(300),
    _ft_min SMALLINT,
    _ft_max SMALLINT,
    _price DECIMAL(12,4),
    _is_conditional BOOLEAN,
    _creation_responsable VARCHAR(100)
)

BEGIN

INSERT INTO Marina_Mooring_Rates 
(
    marina_mooring_rate_type_id, 
    name, 
    description,
    ft_min,
    ft_max,
    price,
    is_conditional,
    creation_responsable,
    creation_date
)
VALUES
(
    _marina_mooring_rate_type_id, 
    _name, 
    _description,
    _ft_min,
    _ft_max,
    _price,
    _is_conditional,
    _creation_responsable,
    NOW()
);

END