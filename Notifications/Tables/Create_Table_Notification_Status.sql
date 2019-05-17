/* Table "Notification_Status"
Almacena los diferentes tipos de estados de las notificaciones,
que indica la situación del mismo.

notification_status_id  -> id natural
notification_status     -> estado de la notificación
logic_deleted           -> borrado lógico
logic_deleted_date      -> fecha de borrado lógico

PK = notification_status_id 
*/
CREATE TABLE IF NOT EXISTS notification_status(
    notification_status_id INT NOT NULL AUTO_INCREMENT,
    notification_status VARCHAR(100) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (notification_status_id)
);