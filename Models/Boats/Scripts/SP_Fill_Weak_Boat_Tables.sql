
/* SP SP_FILL_WEAK_BOAT_TABLES: Llena las tablas debiles del modelo de botes */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FILL_WEAK_BOAT_TABLES`()
BEGIN
/* Llena la tabla "Cable_Types" de cables */
CALL SP_CREATE_CABLE_TYPE('50V', '50', 'Cable de 50V', '4.88');
CALL SP_CREATE_CABLE_TYPE('100V', '100', 'Cable de 100V', '5.88');
CALL SP_CREATE_CABLE_TYPE('150V', '150', 'Cable de 150V', '6.77');
CALL SP_CREATE_CABLE_TYPE('200V', '200', 'Cable de 200V', '9.00');
CALL SP_CREATE_CABLE_TYPE('300V', '300', 'Cable de 400V Ultra Charge', '14.31');

/* Tipos de sockets */
CALL SP_CREATE_SOCKET_TYPE('20A 50V Locking', 'Socket tipo Locking de 20A - 50V');
CALL SP_CREATE_SOCKET_TYPE('30A 100V Locking', 'Socket tipo Locking de 30A - 100V');
CALL SP_CREATE_SOCKET_TYPE('50A 150V Locking', 'Socket tipo Locking de 50A - 150V');
CALL SP_CREATE_SOCKET_TYPE('20A 200V Locking', 'Socket tipo Locking de 20A - 200V');
CALL SP_CREATE_SOCKET_TYPE('87A 300V Straight Blade', 'Socket tipo Straight blade');

/* Tipos de documentos */
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Seguro de Barco", 1);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Acta Náutica", 1);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Permiso de Amarre", 1);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Libreta de Mar", 1);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Certificación Seguridad Náutica ISO-56009", 0);
CALL SP_CREATE_BOAT_DOCUMENT_TYPE("Certificación Seguridad Náutica ISO-48009", 0);

/* Tipos de Slips */
CALL SP_CREATE_SLIP_TYPE("Slip Chico", 1, 46);
CALL SP_CREATE_SLIP_TYPE("Slip Mediano", 47, 61);
CALL SP_CREATE_SLIP_TYPE("Slip Grande", 62, 72);
CALL SP_CREATE_SLIP_TYPE("Slip Enorme", 73, 120);

/* Slips */
/* Hace que el autoIncrement empiece en 1 para que 
coincidan los ID's con el número de slip. */
ALTER TABLE slips AUTO_INCREMENT = 1;
SET  @slip = 1;

/* 1-1      -> Enorme */
WHILE @slip <= 1 DO 
    CALL SP_CREATE_SLIP(4);
    SET @slip = @slip + 1;
END WHILE;
/* 2-11     -> Grande */
WHILE @slip <= 11 DO 
    CALL SP_CREATE_SLIP(3);
    SET @slip = @slip + 1;
END WHILE;
/* 12-35    -> Mediano */
WHILE @slip <= 35 DO 
    CALL SP_CREATE_SLIP(2);
    SET @slip = @slip + 1;
END WHILE;
/* 36-82    -> Pequeño */
WHILE @slip <= 82 DO 
    CALL SP_CREATE_SLIP(1);
    SET @slip = @slip + 1;
END WHILE;
/* 83-87    -> Enorme */
WHILE @slip <= 87 DO 
    CALL SP_CREATE_SLIP(4);
    SET @slip = @slip + 1;
END WHILE;
/* 88-90    -> Grande */
WHILE @slip <= 90 DO 
    CALL SP_CREATE_SLIP(3);
    SET @slip = @slip + 1;
END WHILE;
/* 91-152   -> Pequeño */
WHILE @slip <= 152 DO 
    CALL SP_CREATE_SLIP(1);
    SET @slip = @slip + 1;
END WHILE;
/* 153-174  -> Mediano  */
WHILE @slip <= 174 DO 
    CALL SP_CREATE_SLIP(2);
    SET @slip = @slip + 1;
END WHILE;
/* 175-176  -> Enorme */
WHILE @slip <= 176 DO 
    CALL SP_CREATE_SLIP(4);
    SET @slip = @slip + 1;
END WHILE;
END

