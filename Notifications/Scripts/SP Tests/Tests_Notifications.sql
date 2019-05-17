/* Borra todos los rows previos */
DELETE FROM notifications;
TRUNCATE TABLE notifications;

CALL SP_CREATE_NOTIFICATION(1, 1, 1, 1, 1, 'notificación de prueba', 'este es un mensaje', 'eduardo', '2010-11-12 16:14:47');
CALL SP_CREATE_NOTIFICATION(1, 1, 1, 1, 1, 'notificación de prueba 2', 'este es un mensaje', 'eduardo', '2010-11-12 16:14:47');

CALL SP_READ_NOTIFICATIONS();

CALL SP_DELETE_NOTIFICATION(1);

CALL SP_UPDATE_NOTIFICATION(2, 1, 1, 1, 1, 1, 'notificación de prueba modificado', 'este es un mensaje', 'eduardo', '2010-11-12 16:14:47');
CALL SP_READ_NOTIFICATIONS();