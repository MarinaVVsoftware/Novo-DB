use novodb;

/* CREATE TABLE Electonic_Signatures */
CREATE TABLE IF NOT EXISTS Electonic_Signatures (
    electronic_signature_id INT NOT NULL AUTO_INCREMENT,
    signature SMALLINT,
    attemps INT,
    attemps_reset_date DATETIME,

    PRIMARY KEY(electronic_signature_id)
);

/* CREATE TABLE Electronic_Signature_Historics */
CREATE TABLE IF NOT EXISTS Electronic_Signature_Historics (
    electronic_signature_historic_id INT NOT NULL AUTO_INCREMENT,
    electronic_signature_historic_type_id INT NOT NULL,
    client_id INT NOT NULL,
    date DATETIME,
    alter_responsable VARCHAR(100),

    PRIMARY KEY(electronic_signature_historic_id)
);

/* CREATE TABLE Electronic_Signature_Historic_Types */
CREATE TABLE IF NOT EXISTS Electronic_Signature_Historic_Types (
    electronic_signature_historic_type_id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(100),

    PRIMARY KEY(electronic_signature_historic_type_id)
);

/* FOREIGN KEY */
/*ALTER TABLE Electronic_Signature_Historics ADD FOREIGN KEY(electronic_signature_historic_type_id) REFERENCES Electronic_Signature_Historic_Types(electronic_signature_historic_type_id);*/
