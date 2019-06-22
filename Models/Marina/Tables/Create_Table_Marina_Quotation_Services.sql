/* Table "Marina Quotation Services"
Almacena las ventas de servicios adicionales de marina húmeda.

marina_quotation_service_id         -> ID natural
boat_id                             -> FK con el bote
marina_quotation_service_type_id    -> FK con el tipo servicio
done_status                         -> Define si el servicio fue dado al cliente
quantity                            -> Cantidad de servicios
subtotal                            -> Precio del servicio por la cantidad de servicios solicitados
tax                                 -> Impuestos sobre el subtotal
total                               -> Subtotal mas impuestos
creation_date                       -> Fecha de creación

PK = marina_quotation_service_id 
*/
CREATE TABLE IF NOT EXISTS marina_quotation_services(
    marina_quotation_service_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    marina_quotation_service_id INT NOT NULL,
    done_status BOOLEAN NOT NULL DEFAULT 0,
    quantity SMALLINT NOT NULL,
    subtotal DECIMAL(12,4) NOT NULL,
    tax DECIMAL(12,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (marina_quotation_service_id)
);
