/* SP SP_MarinaQuotationDebts_SetPaid: Establece la deuda como pagada. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationDebts_SetPaid`(
    marina_quotation_debt_id INT
)
BEGIN
    /* verifica que exista la cotización. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotations 
        WHERE marina_quotation_id = _marina_quotation_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Marina quotation was not found. Can't put Debt if quotation doesn't exists.";
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM marina_quotation_debts 
        WHERE marina_quotation_debt_id = _marina_quotation_debt_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Marina quotation debt was not found. Can't set paid if debt doesn't exists.";
    ELSE
        /* Busca el id de la deuda a partir de la cotización */ 
        SELECT marina_quotation_debt_id INTO @debt 
        FROM marina_quotation_debts 
        WHERE marina_quotation_id = _marina_quotation_id;

        /* Actualiza la deuda */
        UPDATE marina_quotation_debts SET
            paid = 1
        WHERE marina_quotation_debt_id = @debt ;
    END IF;
END