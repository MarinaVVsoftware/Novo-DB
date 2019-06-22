/* Table "Marina Payment Services"
Almacena el monto que se le debe cobrar a un cliente por un servicio adicional
de marina húmeda.

marina_payment_service_id   -> ID natural
client_id                   -> FK del cliente
marina_quotation_service_id -> FK de la cotización de servicios adicionales
payment_method_id           -> FK del método de pago
currency                    -> Valor del tipo de cambio
currency_date               -> Fecha del tipo de cambio
payment_received            -> Monto recibido en moneda MXN
client_responsable_payment  -> Responsable del pago por parte del cliente (cliente, responsable o capitán)
creation_responsable        -> Usuario responsable de insertar el row
creation_date               -> Fecha de creación del row

PK = marina_payments 
*/
 CREATE TABLE IF NOT EXISTS marina_payments (
	marina_payment_service_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    marina_quotation_service_id INT NOT NULL,
    payment_method_id INT NOT NULL,
    currency DECIMAL(12,4),
    currency_date DATETIME,
    payment_received DECIMAL(12,4),
    converted_amount DECIMAL(12,4) NOT NULL,
    client_responsable_payment VARCHAR(200) NOT NULL,
    creation_responsable VARCHAR(200) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (marina_payment_service_id)
);