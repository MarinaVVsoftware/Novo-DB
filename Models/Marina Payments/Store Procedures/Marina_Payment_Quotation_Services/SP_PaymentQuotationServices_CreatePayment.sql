/* SP SP_PaymentQuotationServices_CreatePayment: Inserta el pago de un quotation service. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PaymentQuotationServices_CreatePayment`(
    _client_id INT,
    _marina_quotation_service_id INT,
    _payment_method_id INT,
    _currency DECIMAL(12,4),
    _currency_date DATETIME,
    _payment_received DECIMAL(12,4),
    _converted_amount DECIMAL(12,4),
    _client_responsable_payment VARCHAR(200),
    _creation_responsable VARCHAR(200)
)
BEGIN
    /* verifica que exista la cotización de servicio. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotation_services 
        WHERE marina_quotation_service_id = _marina_quotation_service_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Quotation service was not found. Can't create quotation service payment if quotation service doesn't exists.";
    END IF;

    /* verifica que exista el método de pago. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM payment_methods 
        WHERE payment_method_id = _payment_method_id
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Payment method was not found. Can't create quotation service payment if payment method doesn't exists.";
    END IF;

    /* verifica que exista el cliente. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM clients 
        WHERE client_id = _client_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Client was not found. Can't create quotation service payment if client doesn't exists.";
    END IF;

    /* Crea el pago del quotation service */
    INSERT INTO marina_payment_quotation_services (
        client_id,
        marina_quotation_service_id,
        payment_method_id,
        currency,
        cyrrency_date,
        payment_received,
        converted_amount,
        client_responsable_payment,
        creation_responsable
    )
    VALUES (
        _client_id,
        _marina_quotation_service_id,
        _payment_method_id,
        _currency,
        _cyrrency_date,
        _payment_received,
        _converted_amount,
        _client_responsable_payment,
        _creation_responsable
    );
END