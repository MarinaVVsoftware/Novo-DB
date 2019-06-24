/* CREATE TABLE Marina_Quotation_Status */
CREATE TABLE IF NOT EXISTS Marina_Quotation_Status (
    marina_quotation_status_id INT NOT NULL AUTO_INCREMENT,
    status VARCHAR(50),
    
    PRIMARY KEY(marina_quotation_status_id)
);