/* SP SP_MarinaMoratoriumCharge_PutMoratorium: Inserta o modifica un cargo moratorio. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaMoratoriumCharge_PutMoratorium`(
    _marina_quotation_id INT,
    _debt_origin DECIMAL(12,4),
    _moratorium_percentage DECIMAL(12,4),
    _subtotal DECIMAL(12,4),
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4),
    _paid BOOLEAN,
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
        SET MESSAGE_TEXT = "Marina quotation was not found. Can't put moratorium charge if quotation doesn't exists.";
    END IF;

    /* Crea el pago */
    INSERT INTO marina_moratorium_charges (
        marina_quotation_id,
        debt_origin,
        moratorium_percentage,
        subtotal,
        tax,
        total,
        paid,
        creation_responsable
    )
    VALUES (
        _marina_quotation_id,
        _debt_origin,
        _moratorium_percentage,
        _subtotal,
        _tax,
        _total,
        _paid,
        _creation_responsable
    );
END