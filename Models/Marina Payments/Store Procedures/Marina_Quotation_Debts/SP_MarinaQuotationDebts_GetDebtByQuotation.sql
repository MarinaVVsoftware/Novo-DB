/* SP SP_MarinaQuotationDebts_GetDebtByQuotation: Devuelve la deuda de una cotización. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationDebts_GetDebtByQuotation`(
    _marina_quotation_debt_id INT
)
BEGIN
    /* verifica que exista la deuda. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotation_debts 
        WHERE marina_quotation_id = _marina_quotation_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Marina debt was not found. Can't read debt if doesn't exists.";
    END IF;
    
    SELECT
        marina_quotation_debt_id,
        marina_quotation_id,
        subtotal,
        tax,
        total,
        paid,
        creation_responsable,
        creation_date
    FROM marina_quotation_debts
    WHERE marina_quotation_id = _marina_quotation_id;
END