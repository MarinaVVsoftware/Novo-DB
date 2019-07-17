
/* SP SP_FillWeakTables_Marina: Llena las tablas debiles del modelo de botes */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FillWeakTables_Marina`()
BEGIN
    /* Tipos de Slips */
    CALL SP_SlipTypes_PostSlipType("Slip Chico", 1, 46);
    CALL SP_SlipTypes_PostSlipType("Slip Mediano", 47, 61);
    CALL SP_SlipTypes_PostSlipType("Slip Grande", 62, 72);
    CALL SP_SlipTypes_PostSlipType("Slip Enorme", 73, 120);

    /* Slips */
    /* Hace que el autoIncrement empiece en 1 para que 
    coincidan los ID's con el número de slip. */
    ALTER TABLE slips AUTO_INCREMENT = 1;

    /* !!! IMPORTANTE !!!!!!!!! */
    /* Es importante el orden de estos "whiles". favor de no alterar, el orden
    implica lógica de negocio importante, y algunos algoritmos dependen de ello.
    El orden en que los slips son insertados dentro de la tabla implica la prioridad
    de selección al momento de realizar la asignación de slips automatizada. */

    SET @iterator = 36;
    SET @slip_name = 82;
    /* 36-82    -> Pequeño, de mayor a menor */
    WHILE @iterator <= 82 DO 
        CALL SP_Slips_PostSlip(1, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name - 1;
    END WHILE;

    SET @iterator = 127;
    SET @slip_name = 152;
    /* 127-152   -> Pequeño, de mayor a menor */
    WHILE @iterator <= 152 DO 
        CALL SP_Slips_PostSlip(1, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name - 1;
    END WHILE;

    SET @iterator = 91;
    SET @slip_name = 91;
    /* 91-126   -> Pequeño, de menor a mayor */
    WHILE @iterator <= 126 DO 
        CALL SP_Slips_PostSlip(1, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name + 1;
    END WHILE;

    SET @iterator = 153;
    SET @slip_name = 153;
    /* 153-174  -> Mediano, de menor a mayor */
    WHILE @iterator <= 174 DO 
        CALL SP_Slips_PostSlip(2, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name + 1;
    END WHILE;

    SET @iterator = 12;
    SET @slip_name = 12;
    /* 12-35    -> Mediano, de menor a mayor */
    WHILE @iterator <= 35 DO 
        CALL SP_Slips_PostSlip(2, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name + 1;
    END WHILE;

    SET @iterator = 88;
    SET @slip_name = 88;
    /* 88-90    -> Grande, menor a mayor */
    WHILE @iterator <= 90 DO 
        CALL SP_Slips_PostSlip(3, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name + 1;
    END WHILE;

    SET @iterator = 2;
    SET @slip_name = 11;
    /* 2-11     -> Grande, mayor a menor */
    WHILE @iterator <= 11 DO 
        CALL SP_Slips_PostSlip(3, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name - 1;
    END WHILE;

    SET @iterator = 83;
    SET @slip_name = 87;
        /* 83-87    -> Enorme, mayor a menor */
    WHILE @iterator <= 87 DO 
        CALL SP_Slips_PostSlip(4, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name - 1;
    END WHILE;

    SET @iterator = 175;
    SET @slip_name = 175;
    /* 175-176  -> Enorme. menor a mayor */
    WHILE @iterator <= 176 DO 
        CALL SP_Slips_PostSlip(4, @slip_name );
        SET @iterator = @iterator + 1;
        SET @slip_name = @slip_name + 1;
    END WHILE;

    /* 1-1      -> Enorme */
    CALL SP_Slips_PostSlip(4, "1");

    /* Crea los tipos de eventos de timeline */
    CALL SP_MarinaQuotationTimelineTypes_PostType("draft");
    CALL SP_MarinaQuotationTimelineTypes_PostType("sent");
    CALL SP_MarinaQuotationTimelineTypes_PostType("accepted");
    CALL SP_MarinaQuotationTimelineTypes_PostType("validated");
    CALL SP_MarinaQuotationTimelineTypes_PostType("declined");
    CALL SP_MarinaQuotationTimelineTypes_PostType("pay added");
    CALL SP_MarinaQuotationTimelineTypes_PostType("moratorium paid");
    CALL SP_MarinaQuotationTimelineTypes_PostType("moratorium added");
    CALL SP_MarinaQuotationTimelineTypes_PostType("suspended");
    CALL SP_MarinaQuotationTimelineTypes_PostType("closed");
    CALL SP_MarinaQuotationTimelineTypes_PostType("paid");
    CALL SP_MarinaQuotationTimelineTypes_PostType("canceled");
    CALL SP_MarinaQuotationTimelineTypes_PostType("deleted");
    CALL SP_MarinaQuotationTimelineTypes_PostType("arrived");

    /* Inserta los tipos de notificaciones */
    INSERT INTO notification_types (notification_type) VALUES ("Aviso pago pendiente");
    INSERT INTO notification_types (notification_type) VALUES ("Aviso Cargo Moratorio");
    INSERT INTO notification_types (notification_type) VALUES ("Aviso Suspensión");
    INSERT INTO notification_types (notification_type) VALUES ("Aplicación Cargo Moratorio");
    INSERT INTO notification_types (notification_type) VALUES ("Aplicación Suspensión");

    /* Inserta los status de las notificaciones */
    INSERT INTO notification_status_types (notification_status) VALUES ("Pendiente");
    INSERT INTO notification_status_types (notification_status) VALUES ("Cancelado");
    INSERT INTO notification_status_types (notification_status) VALUES ("Enviado");

    /* Inserta la lista de servicios adicionales de marina húmeda */
    INSERT INTO marina_quotation_service_types (service, price) VALUES ("Peaje", 1001.00);
    INSERT INTO marina_quotation_service_types (service, price) VALUES ("Desazolve", 100.00);
    INSERT INTO marina_quotation_service_types (service, price) VALUES ("Almacenamiento", 850.00);
    INSERT INTO marina_quotation_service_types (service, price) VALUES ("Aceite", 40.00);

    /* Inserta la lista de tipos de tarifa de amarre */
    INSERT INTO marina_mooring_tariff_types (tariff_type) VALUES ("General");
    INSERT INTO marina_mooring_tariff_types (tariff_type) VALUES ("Especial");
    INSERT INTO marina_mooring_tariff_types (tariff_type) VALUES ("No Autorizada");


END

