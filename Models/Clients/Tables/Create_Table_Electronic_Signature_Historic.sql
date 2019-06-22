/* Table "Electronic Signature Historic"
Almacena el historial de movimientos y eventos de la 
firma electrónica de los clientes. Cualquier uso, evento o acción
es registrado por seguridad.
electronic_signature_historic_id        -> ID natural
electronic_signature_historic_type_id   -> FK del tipo de Movimiento
client_id                               -> FK del cliente
alter_responsable                       -> Nombre del responsable del movimiento
historic_date                           -> Datetime del momento que se realizó el movimiento

PK = electronic_signature_historic_id 
*/
CREATE TABLE IF NOT EXISTS electronic_signature_historic (
    electronic_signature_historic_id INT NOT NULL AUTO_INCREMENT,
    electronic_signature_historic_type_id INT NOT NULL,
    client_id INT NOT NULL,
    alter_responsable VARCHAR(100) NOT NULL,
    historic_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (electronic_signature_historic_id)
);