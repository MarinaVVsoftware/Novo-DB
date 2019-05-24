/* Llena la tabla "Cable_Types" de cables */
CALL SP_CREATE_CABLE_TYPE('50V', '50', 'Cable de 50V', '4.88');
CALL SP_CREATE_CABLE_TYPE('100V', '100', 'Cable de 100V', '5.88');
CALL SP_CREATE_CABLE_TYPE('150V', '150', 'Cable de 150V', '6.77');
CALL SP_CREATE_CABLE_TYPE('200V', '200', 'Cable de 200V', '9.00');
CALL SP_CREATE_CABLE_TYPE('300V', '300', 'Cable de 400V Ultra Charge', '14.31');

CALL SP_CREATE_SOCKET_TYPE('20A 50V Locking', 'Socket tipo Locking de 20A - 50V');
CALL SP_CREATE_SOCKET_TYPE('30A 100V Locking', 'Socket tipo Locking de 30A - 100V');
CALL SP_CREATE_SOCKET_TYPE('50A 150V Locking', 'Socket tipo Locking de 50A - 150V');
CALL SP_CREATE_SOCKET_TYPE('20A 200V Locking', 'Socket tipo Locking de 20A - 200V');
CALL SP_CREATE_SOCKET_TYPE('87A 300V Straight Blade', 'Socket tipo Straight blade');

CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Seguro de Barco", 1);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Acta Náutica", 1);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Permiso de Amarre", 1);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Libreta de Mar", 1);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Certificación Seguridad Náutica ISO-56009", 0);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Certificación Seguridad Náutica ISO-48009", 0);