/* Borra todos los rows previos */
DELETE FROM slips;
TRUNCATE TABLE slips;

CALL SP_CREATE_SLIP(1, 'slip 1');
CALL SP_CREATE_SLIP(2, 'slip 2');
CALL SP_CREATE_SLIP(1, 'slip 3');
CALL SP_CREATE_SLIP(1, 'slip 4');
CALL SP_CREATE_SLIP(1, 'slip dañado');

CALL SP_READ_SLIPS();

CALL SP_DELETE_SLIP(1);
CALL SP_UPDATE_SLIP(5, 3, 'slip 5');

