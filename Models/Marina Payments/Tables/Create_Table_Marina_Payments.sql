/* Table "Users"
Almacena el monto que se le debe cobrar a un cliente por una cotización.
En el momento que el cliente llega, se crea una deuda para el cliente
puesto que ya se encuentra consumiendo el servicio formalmente.

marina_payments             -> ID natural
payment_method_id           -> FK de la cotización
currency                    -> monto a pagar sin impuestos
cyrrency_date               -> fecha del
payment_received            -> Monto del pago recibido
converted_amount            -> Monto del pago en pesos
client_responsable_payment  -> Responsable del pago por parte del cliente (cliente, responsable o capitán)
creation_responsable        -> Responsable de haber creado el pago
creation_date               -> Fecha de creación del pago

PK = marina_payments 
*/
 CREATE TABLE IF NOT EXISTS marina_payments (
	marina_payment_id INT NOT NULL AUTO_INCREMENT,
    payment_method_id INT NOT NULL,
    currency DECIMAL(12,4) NOT NULL,
    cyrrency_date DATETIME NOT NULL,
    payment_received DECIMAL(12,4) NOT NULL,
    converted_amount DECIMAL(12,4) NOT NULL,
    client_responsable_payment DATETIME VARCHAR(200) NOT NULL,
    creation_responsable DATETIME VARCHAR(200) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (marina_payments)
);