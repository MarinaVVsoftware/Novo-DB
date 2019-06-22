/* Table "Marina Payment Moratorium Charges" - TABLA RELACIONAL
Almacena la relación entre cargos moratorios y sus pagos asociados.
Dado que un cargo moratorio puede recibir muchos pagos, dichas relaciones 
se guardan en una tabla de relaciones.

marina_payment_moratorium_charge_id -> ID natural
client_id                           -> FK con el cliente
marina_moratorium_charge_id         -> FK con el cargo moratorio
marina_payment_id                   -> FK con todos los pagos asociados al cargo moratorio
marina_quotation_id                 -> FK con la cotización

PK = marina_payment_moratorium_charge_id 
*/
 CREATE TABLE IF NOT EXISTS marina_payment_moratorium_charges (
	marina_payment_moratorium_charge_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    marina_quotation_id INT NOT NULL,
    marina_payment_id INT NOT NULL,
    marina_quotation_debt_id INT NOT NULL,

    PRIMARY KEY (marina_payment_moratorium_charge_id)
);