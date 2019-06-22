/* Table "Marina Moratorium Charges"
Almacena la información de un cargo moratorio.

marina_moratorium_charge_id -> ID natural
marina_quotation_id         -> FK de la cotización de Marina
debt_origin                 -> Monto del que se originó el cargo moratorio, puede ser por el total de la deuda o una parte.
moratorium_percentage       -> Porcentaje de cargo moratorio aplicado sobre debt_origin
subtotal                    -> Monto a pagar sin impuestos
tax                         -> Impuestos sobre el subtotal
total                       -> Subtotal mas impuestos
paid                        -> Indica si ya fue pagado el cargo moratorio
creation_responsable        -> Usuario responsable de insertar el row
creation_date               -> Fecha de creación del row

PK = marina_moratorium_charge_id 
*/
 CREATE TABLE IF NOT EXISTS marina_moratorium_charges (
	marina_moratorium_charge_id INT NOT NULL AUTO_INCREMENT,
    marina_quotation_id INT NOT NULL,
    debt_origin DECIMAL(12,4) NOT NULL,
    moratorium_percentage DECIMAL(12,4) NOT NULL,
    subtotal DECIMAL(12,4) NOT NULL,
    tax DECIMAL(12,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    paid BOOLEAN NOT NULL,
    creation_responsable VARCHAR(200) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (marina_moratorium_charge_id)
);