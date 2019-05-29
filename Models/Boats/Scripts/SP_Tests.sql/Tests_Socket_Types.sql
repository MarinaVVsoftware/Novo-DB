/* Borra todos los rows previos */
DELETE FROM socket_types;
TRUNCATE TABLE socket_types;

CALL SP_CREATE_SOCKET_TYPE('15A 125V Straight Blade', 'socket tipo Straight blade');
CALL SP_CREATE_SOCKET_TYPE('20A 125V Locking', '');
CALL SP_CREATE_SOCKET_TYPE('30A 125V Locking', '');
CALL SP_CREATE_SOCKET_TYPE('50A 125V Locking', '');
CALL SP_CREATE_SOCKET_TYPE('20A 250V Locking', 'socket choncho carnal');

CALL SP_READ_SOCKET_TYPES();

CALL SP_DELETE_SOCKET_TYPE(1);
CALL SP_UPDATE_SOCKET_TYPE(5, '20A 250V Locking', 'macizo carnal!');
CALL SP_READ_SOCKET_TYPES();


