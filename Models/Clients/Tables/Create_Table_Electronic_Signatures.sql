/* CREATE TABLE electonic_signatures */
CREATE TABLE IF NOT EXISTS electonic_signatures (
    electronic_signature_id INT NOT NULL AUTO_INCREMENT,
    signature SMALLINT NOT NULL,
    attemps INT NOT NULL DEFAULT 0,
    attemps_reset_date DATETIME DEFAULT NULL,

    PRIMARY KEY(electronic_signature_id)
);