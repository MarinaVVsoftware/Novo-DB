/* Table "Marina Quotation Service Types" - TABLA DEBIL
Almacena los tipos servicios adicionales que se venden
en la marina húmeda.

marina_quotation_service_type_id    -> ID natural
service                             -> Servicio adicional de marina húmeda
price                               -> Precio del servicio
logic_deleted                       -> Borrado lógico
logic_deleted_date                  -> Fecha de borrado lógico

PK = marina_quotation_service_type_id 
*/
CREATE TABLE IF NOT EXISTS marina_quotation_service_types(
    marina_quotation_service_type_id INT NOT NULL AUTO_INCREMENT,
    service VARCHAR(50) NOT NULL,
    price DECIMAL(12, 4),
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (marina_quotation_service_type_id)
);
