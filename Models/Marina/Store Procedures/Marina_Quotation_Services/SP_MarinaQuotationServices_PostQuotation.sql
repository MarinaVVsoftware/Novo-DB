/* SP SP_MarinaQuotationServices_PostQuotation: Crea una cotizacion de servicio adicional. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationServices_PostQuotation`(
    _boat_id INT,
    _marina_quotation_service_type_id INT,
    _quantity SMALLINT,
    _subtotal DECIMAL(12,4),
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4)
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM boats 
        WHERE boat_id = _boat_id
        AND logical_deleted = 0
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Boat was not found. Can't post quotation service without a boat id valid.";
    END IF;

    /* verifica que exista el tipo de servicio. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotation_service_types 
        WHERE marina_quotation_service_type_id = _marina_quotation_service_type_id
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Service type was not found. Can't post quotation service without a service type name valid.";
    END IF;

    INSERT INTO marina_quotation_services(
        boat_id,
        marina_quotation_service_type_id,
        quantity,
        subtotal,
        tax,
        total
    )
    VALUES(
        _boat_id,
        _marina_quotation_service_type_id,
        _quantity,
        _subtotal,
        _tax,
        _total
    );
END