/* Table "Users"
Almacena el monto que se le debe cobrar a un cliente por una cotización.
En el momento que el cliente llega, se crea una deuda para el cliente
puesto que ya se encuentra consumiendo el servicio formalmente.

marina_quotation_debt_id    -> ID natural
marina_quotation_id         -> FK de la cotización
subtotal                    -> monto a pagar sin impuestos
tax                         -> impuestos sobre el subtotal
total                       -> monto a pagar más impuestos
paid                        -> FK del rol del usuario
creation_date               -> FK del rol del usuario

PK = marina_quotation_debt_id 
*/
 CREATE TABLE IF NOT EXISTS marina_quotation_debts (
	marina_payment_id INT NOT NULL AUTO_INCREMENT,
    payment_method_id INT NOT NULL,
    currency DECIMAL(12,4) NOT NULL,
    cyrrency_date DATETIME NOT NULL,
    payment_received DECIMAL(12,4) NOT NULL,
    converted_amount DECIMAL(12,4) NOT NULL,
    client_responsable_payment DATETIME VARCHAR(200) NOT NULL,
    creation_responsable DATETIME VARCHAR(200) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (marina_quotation_debt_id)
);