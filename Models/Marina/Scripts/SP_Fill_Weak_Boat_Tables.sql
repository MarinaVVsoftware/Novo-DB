
/* SP SP_FillWeakBoatTables: Llena las tablas debiles del modelo de botes */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FillWeakMarinaTables`()
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
    SET  @slip = 1;

    /* 1-1      -> Enorme */
    WHILE @slip <= 1 DO 
        CALL SP_Slips_PostSlip(4);
        SET @slip = @slip + 1;
    END WHILE;
    /* 2-11     -> Grande */
    WHILE @slip <= 11 DO 
        CALL SP_Slips_PostSlip(3);
        SET @slip = @slip + 1;
    END WHILE;
    /* 12-35    -> Mediano */
    WHILE @slip <= 35 DO 
        CALL SP_Slips_PostSlip(2);
        SET @slip = @slip + 1;
    END WHILE;
    /* 36-82    -> Pequeño */
    WHILE @slip <= 82 DO 
        CALL SP_Slips_PostSlip(1);
        SET @slip = @slip + 1;
    END WHILE;
    /* 83-87    -> Enorme */
    WHILE @slip <= 87 DO 
        CALL SP_Slips_PostSlip(4);
        SET @slip = @slip + 1;
    END WHILE;
    /* 88-90    -> Grande */
    WHILE @slip <= 90 DO 
        CALL SP_Slips_PostSlip(3);
        SET @slip = @slip + 1;
    END WHILE;
    /* 91-152   -> Pequeño */
    WHILE @slip <= 152 DO 
        CALL SP_Slips_PostSlip(1);
        SET @slip = @slip + 1;
    END WHILE;
    /* 153-174  -> Mediano  */
    WHILE @slip <= 174 DO 
        CALL SP_Slips_PostSlip(2);
        SET @slip = @slip + 1;
    END WHILE;
    /* 175-176  -> Enorme */
    WHILE @slip <= 176 DO 
        CALL SP_Slips_PostSlip(4);
        SET @slip = @slip + 1;
    END WHILE;

    /* Crea los tipos de eventos de timeline */
    CALL SP_MarinaQuotationTimelineTypes_PostType("draft");
    CALL SP_MarinaQuotationTimelineTypes_PostType("formal");
    CALL SP_MarinaQuotationTimelineTypes_PostType("accept");
    CALL SP_MarinaQuotationTimelineTypes_PostType("validate");
    CALL SP_MarinaQuotationTimelineTypes_PostType("pay");
    CALL SP_MarinaQuotationTimelineTypes_PostType("pay moratorium");
    CALL SP_MarinaQuotationTimelineTypes_PostType("add moratorium");
    CALL SP_MarinaQuotationTimelineTypes_PostType("cancel");
    CALL SP_MarinaQuotationTimelineTypes_PostType("delete");
    CALL SP_MarinaQuotationTimelineTypes_PostType("arrive");

END

