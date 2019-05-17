/* Borra todos los rows previos */
DELETE FROM responsible;
TRUNCATE TABLE responsible;

CALL SP_CREATE_RESPONSABLE(1, "Marco Antonio", "+529981080808", "marco@mail.com", 0, 0);
CALL SP_CREATE_RESPONSABLE(1, "Shard Jertz", "+529981090909", "jertz@mail.com", 0, 1);
CALL SP_CREATE_RESPONSABLE(1, "Jhon Fabron", "+529981090909", "jhon@mail.com", 1, 1);

CALL SP_READ_RESPONSIBLE();

CALL SP_DELETE_RESPONSABLE(1);

CALL SP_UPDATE_RESPONSABLE(3, 1, "Jhon Fabron", "+529981090923", "jhon@mail.com", 1, 1);
CALL SP_READ_RESPONSIBLE();