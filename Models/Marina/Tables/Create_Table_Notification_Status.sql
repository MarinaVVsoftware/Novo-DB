/* Table "Notification_Status_Types"
Almacena los diferentes tipos de estados de las notificaciones,
que indica la situación del mismo.

notification_status_id  -> ID natural
notification_status     -> Estado de la notificación
logic_deleted           -> Borrado lógico
logic_deleted_date      -> Fecha de borrado lógico

PK = notification_status_id 
*/
CREATE TABLE IF NOT EXISTS notification_status_types(
    notification_status_id INT NOT NULL AUTO_INCREMENT,
    notification_status VARCHAR(100) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (notification_status_id)
);