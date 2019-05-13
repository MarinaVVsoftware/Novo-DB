/* Table "Notification_Types"
Almacena las notificaciones generadas en el sistema.

notification_id                 -> id natural
client_id                       -> FK con "clients"
notification_type_id            -> FK con "notification_types"
notification_status_id          -> FK con "notificacion_status"
marina_quotation_id             -> FK con "marina_quotations"
marina_quotation_services_id    -> FK con la tabla "marina_quotation_services"
title                           -> titulo de la notificación
message                         -> mensaje
creation_responsable            -> responsable de la creación
creation_date                   -> fecha de creación
date_to_send                    -> fecha en la que se enviará la notificación
logical_deleted                 -> borrado lógico
logical_deleted_date            -> fecha de borrado lógico

PK = notification_id 
*/
CREATE TABLE IF NOT EXISTS notifications(
    notification_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    notification_type_id INT NOT NULL,
    notification_status_id INT NOT NULL,
    marina_quotation_id INT NOT NULL,
    marina_quotation_services_id INT NOT NULL,
    title VARCHAR(200),
    message VARCHAR(500),
    creation_responsable VARCHAR(100),
    creation_date DATETIME NOT NULL DEFAULT NOW(),
    date_to_send DATETIME NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (notification_id)
);