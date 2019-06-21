/* Table "Payment Methods" - TABLA DEBIL
Almacena la información de los métodos de pago.

payment_method_id   -> ID natural
payment_name        -> Nombre del método de pago

PK = payment_method_id 
*/
 CREATE TABLE IF NOT EXISTS payment_methods (
	payment_method_id INT NOT NULL AUTO_INCREMENT,
    payment_name VARCHAR(100) NOT NULL,

    PRIMARY KEY (payment_method_id)
);