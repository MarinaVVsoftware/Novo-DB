/* CREATE TABLE electronic_signature_historic_types */
CREATE TABLE IF NOT EXISTS electronic_signature_historic_types (
    electronic_signature_historic_type_id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(100) NOT NULL UNIQUE,

    PRIMARY KEY(electronic_signature_historic_type_id)
);