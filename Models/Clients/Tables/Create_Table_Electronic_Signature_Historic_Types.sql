/* Table "Electronic Signature Historic Types" - TABLA DEBIL
Almacena los tipos de movimientos en las firmas
electrónicas de los clientes.

electronic_signature_historic_type_id   -> ID natural
historic_type                           -> Tipo de Movimiento

PK = electronic_signature_historic_type_id 
*/
CREATE TABLE IF NOT EXISTS electronic_signature_historic_types (
    electronic_signature_historic_type_id INT NOT NULL AUTO_INCREMENT,
    historic_type VARCHAR(100) NOT NULL UNIQUE,

    PRIMARY KEY (electronic_signature_historic_type_id)
);