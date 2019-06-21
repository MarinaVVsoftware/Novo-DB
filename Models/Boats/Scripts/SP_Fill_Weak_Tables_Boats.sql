
/* SP SP_FillWeakBoatTables: Llena las tablas debiles del modelo de botes */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FillWeakBoatTables`()
BEGIN
    /* Llena la tabla "Cable_Types" de cables */
    CALL SP_CableTypes_PostCableType('50V', '50', 'Cable de 50V', '4.88');
    CALL SP_CableTypes_PostCableType('100V', '100', 'Cable de 100V', '5.88');
    CALL SP_CableTypes_PostCableType('150V', '150', 'Cable de 150V', '6.77');
    CALL SP_CableTypes_PostCableType('200V', '200', 'Cable de 200V', '9.00');
    CALL SP_CableTypes_PostCableType('300V', '300', 'Cable de 400V Ultra Charge', '14.31');

    /* Tipos de sockets */
    CALL SP_SocketTypes_PostSocketType('20A 50V Locking', 'Socket tipo Locking de 20A - 50V');
    CALL SP_SocketTypes_PostSocketType('30A 100V Locking', 'Socket tipo Locking de 30A - 100V');
    CALL SP_SocketTypes_PostSocketType('50A 150V Locking', 'Socket tipo Locking de 50A - 150V');
    CALL SP_SocketTypes_PostSocketType('20A 200V Locking', 'Socket tipo Locking de 20A - 200V');
    CALL SP_SocketTypes_PostSocketType('87A 300V Straight Blade', 'Socket tipo Straight blade');

    /* Tipos de documentos */
    CALL SP_BoatDocumentTypes_PostDocumentType("Seguro de Barco", 1);
    CALL SP_BoatDocumentTypes_PostDocumentType("Acta Náutica", 1);
    CALL SP_BoatDocumentTypes_PostDocumentType("Permiso de Amarre", 1);
    CALL SP_BoatDocumentTypes_PostDocumentType("Libreta de Mar", 1);
    CALL SP_BoatDocumentTypes_PostDocumentType("Certificación Seguridad Náutica ISO-56009", 0);
    CALL SP_BoatDocumentTypes_PostDocumentType("Certificación Seguridad Náutica ISO-48009", 0);
END

