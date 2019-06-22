/* Table "Marina Payment Quotation Debts" - TABLA RELACIONAL
Almacena la relación entre deudas de una cotización y sus pagos asociados.
Dado que una cotización puede recibir muchos pagos, dichas relaciones se guardan
en una tabla de relaciones.

marina_payment_quotation_debt_id    -> ID natural
client_id                           -> FK con el cliente
marina_quotation_id                 -> FK de la cotización de Marina
marina_payment_id                   -> FK con todos los pagos asociados a la cotización
marina_quotation_debt_id            -> FK con la deuda por la cotización

PK = marina_payment_quotation_debt_id 
*/
 CREATE TABLE IF NOT EXISTS marina_quotation_debts (
	marina_payment_quotation_debt_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    marina_quotation_id INT NOT NULL,
    marina_payment_id INT NOT NULL,
    marina_quotation_debt_id INT NOT NULL,

    PRIMARY KEY (marina_payment_quotation_debt_id)
);