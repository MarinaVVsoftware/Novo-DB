/* Table "Notifications"
Almacena las notificaciones generadas en el sistema.

notification_id                 -> ID natural
client_id                       -> FK con "clients"
notification_type_id            -> FK con "notification_types"
notification_status_id          -> FK con "notificacion_status"
marina_quotation_id             -> FK con "marina_quotations"
marina_quotation_services_id    -> FK con la tabla "marina_quotation_services"
title                           -> Título de la notificación
message                         -> Mensaje
creation_responsable            -> Responsable de la creación
creation_date                   -> Fecha de creación
date_to_send                    -> Fecha en la que se enviará la notificación
logical_deleted                 -> Borrado lógico
logical_deleted_date            -> Fecha de borrado lógico

PK = notification_id 
*/
CREATE TABLE IF NOT EXISTS notifications(
    notification_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    notification_type_id INT NOT NULL,
    notification_status_id INT NOT NULL,
    marina_quotation_id INT NOT NULL,
    marina_quotation_services_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    message VARCHAR(500) NOT NULL,
    creation_responsable VARCHAR(100) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),
    date_to_send DATETIME NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (notification_id)
);