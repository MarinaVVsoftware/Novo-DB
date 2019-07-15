/* Table "marina_mooring_tariff"
Almacena las tarifas de amarre de marina húmeda

marina_mooring_tariff_id        -> ID natural
marina_mooring_tariff_type_id   -> FK con el tipo de tarifa
name                            -> Nombre de la tarifa
description                     -> Descripción de la tarifa
ft_min                          -> Pies mínimos donde aplica la tarifa
ft_max                          -> Pies máximos donde aplica la tarifa
price                           -> Precio de la tarifa por día
is_conditional                  -> Booleano, true indica que aplica el máximo y mínimo
creation_responsable            -> Responsable de crear la tarifa
creation_date                   -> Fecha de creación de la tarifa
logical_deleted                 -> Borrado lógico
logical_deleted_date            -> Fecha de borrado lógico

PK = incident_type_id 
*/
CREATE TABLE IF NOT EXISTS marina_mooring_tariff (
    marina_mooring_tariff_id INT NOT NULL AUTO_INCREMENT,
    marina_mooring_tariff_type_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(300) NOT NULL,
    ft_min SMALLINT NOT NULL,
    ft_max SMALLINT NOT NULL,
    price DECIMAL(12,4) NOT NULL,
    is_conditional BOOLEAN DEFAULT 1,
    creation_responsable VARCHAR(100) NOT NULL,
    creation_date DATETIME DEFUALT NOW(),
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,
    
    PRIMARY KEY(marina_mooring_tariff_id)
);