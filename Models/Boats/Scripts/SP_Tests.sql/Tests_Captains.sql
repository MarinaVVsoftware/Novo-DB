/* Borra todos los rows previos */
DELETE FROM captains;
TRUNCATE TABLE captains;

CALL SP_CREATE_CAPTAIN(1, "Marco Antonio", "+529981080808", "marco@mail.com", 0, 0);
CALL SP_CREATE_CAPTAIN(1, "Shard Jertz", "+529981090909", "jertz@mail.com", 0, 1);
CALL SP_CREATE_CAPTAIN(1, "Jhon Fabron", "+529981090909", "jhon@mail.com", 1, 1);

CALL SP_READ_CAPTAINS();

CALL SP_DELETE_CAPTAIN(1);

CALL SP_UPDATE_CAPTAIN(3, 1, "Jhon Fabron", "+529981090923", "jhon@mail.com", 1, 1);
CALL SP_READ_CAPTAINS();