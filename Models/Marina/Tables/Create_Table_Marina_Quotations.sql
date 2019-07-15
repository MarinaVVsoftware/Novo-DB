/* Table "marina_quotations"
Almacena las cotizaciones de marina húmeda.

marina_quotation_id             -> ID natural
boat_id                         -> FK del ID del bote
marina_quotation_status_id      -> FK del status de la cotización
marina_mooring_tariff_id        -> FK de la tarifa de amarre de la cotización
marina_quotation_electricity_id -> FK de la tarifa eléctrica de la cotización
arrival_date                    -> Fecha de llegada del barco
departure_date                  -> Fecha de salida del barco
arrival_status                  -> Estatus de arribo dentro de la marina
mooring_tariff                  -> Valor numérico de la tarifa de amarre
loa                             -> Valor numérico de la dimensión del barco
days_stay                       -> Días de estadía
discount_stay_percentage        -> Porcentaje de descuento
currency_amount                 -> Monto del tipo de cambio de dólares
subtotal                        -> Monto total a cobrar
tax                             -> Impuestos sobre el monto de subtotal
total                           -> subtotal mas tax
monthly_quotation               -> Booleano, si es una cotización mensual
semiannual_quotation            -> Booleano, si es una cotización semestral
annual_quotation                -> Booleano, si es una cotización anual
group_quotation                 -> Indica el grupo de cotizaciones asociado al que pertenece
creation_responsable            -> Responsable de crear la cotización
creation_date                   -> Fecha de creación de la cotización

PK = marina_quotation_id 
*/
CREATE TABLE IF NOT EXISTS marina_quotations (
    marina_quotation_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    marina_quotation_status_id INT NOT NULL,
    marina_mooring_tariff_id INT NOT NULL,
    marina_quotation_electricity_id INT, 
    arrival_date DATETIME NOT NULL,
    departure_date DATETIME NOT NULL,
    arrival_status BOOLEAN NOT NULL,
    mooring_tariff DECIMAL(12,4) NOT NULL,
    loa DECIMAL(12,4) NOT NULL,
    days_stay INT NOT NULL, 
    discount_stay_percentage DECIMAL(12,4) DEFAULT 0.0,
    currency_amount DECIMAL(12,4) NOT NULL,
    subtotal DECIMAL(12,4) NOT NULL,    
    tax DECIMAL(12,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    monthly_quotation BOOLEAN DEFAULT 0,
    semiannual_quotation BOOLEAN DEFAULT 0,
    annual_quotation BOOLEAN DEFAULT 0,
    group_quotation VARCHAR(50) NOT NULL,
    creation_responsable VARCHAR(100) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (marina_quotation_id)
);