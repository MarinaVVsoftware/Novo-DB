/* SP SP_MarinaQuotationDebts_PutDebt: Inserta o modifica una deuda de cotización. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationDebts_PutDebt`(
    _marina_quotation_id INT,
    _subtotal DECIMAL(12,4),
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4),
    _creation_responsable VARCHAR(200)
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
        /* Crea la deuda */
        INSERT INTO marina_quotation_debts (
            marina_quotation_id,
            subtotal,
            tax,
            total,
            creation_responsable
        )
        VALUES (
            _marina_quotation_id,
            _subtotal,
            _tax,
            _total,
            _creation_responsable
        );
    ELSE
        /* Busca el id de la deuda a partir de la cotización */ 
        SELECT marina_quotation_debt_id INTO @debt 
        FROM marina_quotation_debts 
        WHERE marina_quotation_id = _marina_quotation_id;

        /* Actualiza la deuda */
        UPDATE marina_quotation_debts SET
            marina_quotation_id = _marina_quotation_id,
            subtotal = _subtotal,
            tax = _tax,
            total = _total,
            creation_responsable = _creation_responsable
        WHERE marina_quotation_debt_id = @debt ;
    END IF;
END