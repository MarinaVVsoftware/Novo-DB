/* SP SP_MarinaQuotations_PostQuotation: Crea una cotización de marina húmeda */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotations_PostQuotation`(
    _boat_id INT,
    _marina_quotation_status_id INT,
    _marina_mooring_tariff_id INT,
    _arrival_date DATETIME,
    _departure_date DATETIME,
    _mooring_tariff DECIMAL(12,4),
    _loa DECIMAL(12,4),
    _days_stay INT, 
    _discount_stay_percentage DECIMAL(12,4),
    _currency_amount DECIMAL(12,4),
    _tax DECIMAL(12,4),
    _subtotal DECIMAL(12,4),
    _total DECIMAL(12,4),
    _monthly_quotation BOOLEAN,
    _annual_quotation BOOLEAN,
    _semiannual_quotation BOOLEAN, 
    _group_quotation INT,
    _creation_responsable VARCHAR(100)
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
        SET MESSAGE_TEXT = "Boat doesn't exist. Can't post quotation without a boat id valid.";
    END IF;

    /* verifica que exista el status. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_quotation_status
        WHERE marina_quotation_status_id = _marina_quotation_status_id
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Quotation status doesn't exist. Can't post quotation without a status id valid.";
    END IF;

    /* verifica que exista la tarifa. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM _marina_mooring_tariff
        WHERE marina_mooring_tariff_id = _marina_mooring_tariff_id
    ) 
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Morring tariff doesn't exist. Can't post quotation without a tariff valid.";
    END IF;

    INSERT INTO notifications(
        date_to_send
    )
    VALUES(
        _date_to_send
    );
END