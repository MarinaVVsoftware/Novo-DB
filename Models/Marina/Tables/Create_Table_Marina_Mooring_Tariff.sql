/* CREATE TABLE Marina_Mooring_Tariff */
CREATE TABLE IF NOT EXISTS Marina_Mooring_Tariff (
    marina_mooring_tariff_id INT NOT NULL AUTO_INCREMENT,
    marina_mooring_tariff_type_id INT NOT NULL,
    name VARCHAR(100),
    description VARCHAR(300),
    ft_min SMALLINT,
    ft_max SMALLINT,
    price DECIMAL(12,4),
    is_conditional BOOLEAN,
    creation_responsable VARCHAR(100),
    creation_date DATETIME,
    logical_deleted BOOLEAN DEFAULT 0,
    logical_deleted_date DATETIME,
    
    PRIMARY KEY(marina_mooring_tariff_id)
);