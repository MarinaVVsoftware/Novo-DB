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
    INSERT INTO marina_payments (
        payment_method_id,
        currency,
        cyrrency_date,
        payment_received,
        converted_amount,
        client_responsable_payment,
        creation_responsable
    )
    VALUES (
        _payment_method_id,
        _currency,
        _cyrrency_date,
        _payment_received,
        _converted_amount,
        _client_responsable_payment,
        _creation_responsable
    );
END