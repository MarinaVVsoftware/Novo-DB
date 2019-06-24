/* CREATE TABLE Marina_Mooring_Rates_Types */
CREATE TABLE IF NOT EXISTS Marina_Mooring_Tariff_Types (
    marina_mooring_tariff_type_id INT NOT NULL AUTO_INCREMENT, 
    type VARCHAR(100),

    PRIMARY KEY(marina_mooring_tariff_type_id)
);