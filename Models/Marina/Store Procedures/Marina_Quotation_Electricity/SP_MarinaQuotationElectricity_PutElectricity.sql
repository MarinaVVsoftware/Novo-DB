/* SP SP_MarinaQuotationElectricity_GetElectricity: Trae una cotización eléctrica por su id. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationElectricity_GetElectricity`(
    _marina_quotation_id INT,
    _electricity_tariff DECIMAL(12,4),
    _total_days INT,
    _discount_electricity_percentage DECIMAL(12,4),
    _currency_amount DECIMAL(12,4),
    _subtotal DECIMAL(12,4)
    _tax DECIMAL(12,4),
    _total DECIMAL(12,4),
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
    END IF;

    if NOT EXISTS (
        SELECT 1 FROM marina_quotation_electricity 
        WHERE marina_quotation_id = _marina_quotation_id
    )
    THEN
        /* Crea el documento dado que no existe */
        INSERT INTO marina_quotation_electricity (
            marina_quotation_id,
            electricity_tariff,
            total_days,
            discount_electricity_percentage,
            currency_amount,
            subtotal
            tax,
            total,
        )
        VALUES (
            _marina_quotation_id,
            _electricity_tariff,
            _total_days,
            _discount_electricity_percentage,
            _currency_amount,
            _subtotal
            _tax,
            _total,
        );
    ELSE
        UPDATE marina_quotation_electricity SET 
            electricity_tariff = _electricity_tariff,
            total_days = _total_days,
            discount_electricity_percentage = _discount_electricity_percentage,
            currency_amount = _currency_amount,
            subtotal = _subtotal
            tax = _tax,
            total = _total,
        WHERE marina_quotation_id = _marina_quotation_id
    END IF;
END