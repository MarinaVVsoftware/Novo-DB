/* Tabla "Marina_Quotation_Timeline_Types"
Almacena los tipos de rows que se guardan en el timeline, asociados
a los diferentes movimientos históricos de una cotización de marina húmeda.

marina_quotation_timeline_type_id   -> ID natural
timeline_type                       -> tipo de row del timeline insertado


PK = marina_quotation_electricity_id 
*/
CREATE TABLE IF NOT EXISTS marina_quotation_timeline_types(
    marina_quotation_timeline_type_id INT NOT NULL AUTO_INCREMENT,
    timeline_type VARCHAR(50) NOT NULL,

    PRIMARY KEY (marina_quotation_timeline_type_id)
);