/* CREATE TABLE Electronic_Signature_Historics */
CREATE TABLE IF NOT EXISTS electronic_signature_historic (
    electronic_signature_historic_id INT NOT NULL AUTO_INCREMENT,
    electronic_signature_historic_type_id INT NOT NULL,
    client_id INT NOT NULL,
    date DATETIME NOT NULL,
    alter_responsable VARCHAR(100) NOT NULL,

    PRIMARY KEY(electronic_signature_historic_id)
);