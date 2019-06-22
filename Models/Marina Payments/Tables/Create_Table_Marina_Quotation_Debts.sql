/* Table "Marina Quotation Debts"
Almacena la deuda generada sobre un cliente por una cotización de marina
húmeda. Hasta que el cliente aborda en la marina es cuando se genera una deuda
(dado que ya está consumiento el servicio).

marina_quotation_debt_id    -> ID natural
marina_quotation_id         -> FK de la cotización de Marina. Es unique para prevenir cargos adicionales.
subtotal                    -> Monto a pagar sin impuestos
tax                         -> Impuestos sobre el subtotal
total                       -> Subtotal mas impuestos
paid                        -> Indica si ya fue pagada la cotización
creation_responsable        -> Usuario responsable de insertar el row
creation_date               -> Fecha de creación del row

PK = marina_quotation_debt_id 
*/
 CREATE TABLE IF NOT EXISTS marina_quotation_debts (
	marina_quotation_debt_id INT NOT NULL AUTO_INCREMENT,
    marina_quotation_id INT UNIQUE NOT NULL,
    subtotal DECIMAL(12,4) NOT NULL,
    tax DECIMAL(12,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    paid BOOLEAN NOT NULL,
    creation_responsable VARCHAR(200) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (marina_quotation_debt_id)
);