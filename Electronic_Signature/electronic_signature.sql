use novodb;

/* CREATE TABLE Electonic_Signatures */
CREATE TABLE IF NOT EXISTS Electonic_Signatures (
    electronic_signature_id INT AUTO_INCREMENT PRIMARY KEY,
    signature SMALLINT,
    attemps INT,
    attemps_reset_date DATETIME
);

/* CREATE TABLE Electronic_Signature_Historics */
CREATE TABLE IF NOT EXISTS Electronic_Signature_Historics (
    electronic_signature_historic_id INT AUTO_INCREMENT PRIMARY KEY,
    electronic_signature_historic_type_id INT NOT NULL,
    client_id INT NOT NULL,
    date DATETIME,
    alter_responsable VARCHAR(100)
);

/* CREATE TABLE Electronic_Signature_Historic_Types */
CREATE TABLE IF NOT EXISTS Electronic_Signature_Historic_Types (
    electronic_signature_historic_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(100)
);