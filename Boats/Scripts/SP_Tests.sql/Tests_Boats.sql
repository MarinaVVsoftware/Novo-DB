/* Borra todos los rows previos */
DELETE FROM boats;
TRUNCATE TABLE boats;

/* Insert en la tabla Boats a través de SP */
CALL SP_CREATE_BOAT(1, 'Anita', 'Seahawk', '192', '23', '37');
CALL SP_CREATE_BOAT(1, 'Juanita', 'Seahawk', '146', '23', '38');

/* Pinta la tabla resultante */
CALL SP_READ_BOATS();
/* test de read de 1 row via ID */
CALL SP_READ_BOATS();

/* Insert en la tabla Boats a través de SP */
CALL SP_UPDATE_BOAT(1, 1, 'Anita V2', 'Seahawk', '192', '23', '37');
CALL SP_UPDATE_BOAT(2, 1, 'Juanita V2', 'Seahawk', '146', '23', '38');

/* Pinta la tabla resultante */
CALL SP_READ_BOATS();

/* Elimina un row */
CALL SP_DELETE_BOAT(2);