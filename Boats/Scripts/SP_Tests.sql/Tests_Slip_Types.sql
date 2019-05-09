/* Borra todos los rows previos */
DELETE FROM slip_types;
TRUNCATE TABLE slip_types;

/* Test de creación y read */
CALL SP_CREATE_SLIP_TYPE('Slip Pequeño');
CALL SP_CREATE_SLIP_TYPE('Slip Mediano');
CALL SP_CREATE_SLIP_TYPE('Slip Grande');
CALL SP_CREATE_SLIP_TYPE('Slip de Error');
CALL SP_READ_SLIP_TYPES();

/* Test de delete */
CALL SP_DELETE_SLIP_TYPE(1);

/* test de read y update */
CALL SP_UPDATE_SLIP_TYPE(4, 'Slip Enorme!');
CALL SP_READ_SLIP_TYPES();




