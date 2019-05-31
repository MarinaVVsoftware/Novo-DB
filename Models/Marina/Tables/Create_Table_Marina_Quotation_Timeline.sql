/* Tabla "Marina_Quotation_Timeline"
Almacena los diferentes movimientos históricos de una cotización de marina húmeda.

marina_quotation_timeline_id    -> ID natural
marina_quotation_id             -> FK con la tabla marina_quotation
marina_timeline_type_id         -> Tipo de row del timeline insertado
title                           -> Título del evento
description                     -> Texto adicional del evento
creation_responsible            -> Responsable del evento en el timeline
creation_date                   -> Fecha de la creación del row

PK = marina_quotation_electricity_id 
*/
CREATE TABLE IF NOT EXISTS marina_quotation_timeline_types(
    marina_quotation_timeline_type_id INT NOT NULL AUTO_INCREMENT,
    marina_quotation_id INT NOT NULL,
    marina_quotation_timeline_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(300) DEFAULT NULL,
    creation_responsible VARCHAR(200) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (marina_quotation_timeline_type_id)
);