/* SP SP_MarinaPayments_CreatePayment: Inserta o modifica el pago de una cotización. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaPayments_CreatePayment`(
    _payment_method_id INT,
    _currency DECIMAL(12,4),
    _cyrrency_date DATETIME,
    _payment_received DECIMAL(12,4),
    _converted_amount DECIMAL(12,4),
    _client_responsable_payment DATETIME VARCHAR(200),
    _creation_responsable DATETIME VARCHAR(200)
)
BEGIN
    /* verifica que exista el método de pago. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM payment_methods 
        WHERE payment_method_id = _payment_method_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Payment method was not found. Can't create payment if payment method doesn't exists.";
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