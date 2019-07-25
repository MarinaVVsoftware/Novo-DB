/* Tabla "Marina_Quotations_Electricity"
Almacena la información de la tarifa y montos de cobro de electricidad sobre
la cotización de marina húmeda. 

marina_quotation_electricity_id -> ID natural
marina_quotation_id             -> FK con marina_quotations
electricity_tariff              -> Precio en USD, es la suma de los precios de los cables del bote
total_days                      -> Total de días de electricidad cobrados
discount_electricity_percentage -> Porcentaje de descuento sobre el total
currency_amount                 -> Monto del Dolar al momento de crear la cotización
tax                             -> Porcentaje de impuestos sobre el subtotal
subtotal                        -> Monto a pagar sin impuestos
total                           -> Monto a pagar con impuestos

PK = marina_quotation_electricity_id 
*/
CREATE TABLE IF NOT EXISTS marina_quotation_electricity(
    marina_quotation_electricity_id INT NOT NULL AUTO_INCREMENT,
    marina_quotation_id INT NOT NULL,
    electricity_tariff DECIMAL(12,4) NOT NULL,
    total_days INT NOT NULL,
    discount_electricity_percentage DECIMAL(12,4) NOT NULL,
    currency_amount DECIMAL(12,4) NOT NULL,
    subtotal DECIMAL(12,4) NOT NULL,
    tax DECIMAL(12,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,

    PRIMARY KEY (marina_quotation_electricity_id)
);