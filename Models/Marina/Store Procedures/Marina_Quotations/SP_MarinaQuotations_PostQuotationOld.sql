CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotations_PostQuotation`(
    _boat_id INT,
    _marina_quotation_status_id INT,
    _marina_mooring_tariff_id INT,
    _arrival_date DATETIME,
    _departure_date DATETIME,
    _arrival_status BOOLEAN,
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
    _creation_responsable VARCHAR(100),

    /* Electricity */
    _electricity_tariff DECIMAL(12,4),
    _total_electricity_days INT,
    _discount_electricity_percentage DECIMAL(12,4),
    _currency_electricity_amount DECIMAL(12,4),
    _electricity_tax DECIMAL(12,4),
    _electricity_subtotal DECIMAL(12,4),
    _electricity_total DECIMAL(12,4)
)
BEGIN

    SET @electricity_id = null;
    SET @last_quotation_id = null;

	IF(
		_electricity_tariff IS NULL OR 
		_total_electricity_days IS NULL OR
        _discount_electricity_percentage IS NULL OR
        _currency_electricity_amount IS NULL OR
        _electricity_tax IS NULL OR
        _electricity_subtotal IS NULL OR
        _electricity_total IS NULL
	) THEN
		SET @electricity_id = null;
    ELSE
		CALL SP_CREATE_MARINA_QUOTATION_ELECTRICITY(
			_electricity_tariff,
			_total_electricity_days,
			_discount_electricity_percentage,
			_currency_electricity_amount,
			_electricity_tax,
			_electricity_subtotal,
			_electricity_total,
			@electricity_id
		);
    END IF;
    
	INSERT INTO marina_quotations (
		boat_id,
		marina_quotation_status_id,
		marina_mooring_tariff_id,
		marina_quotation_electricity_id,
		arrival_date,
		departure_date,
		arrival_status,
		mooring_tariff,
		loa,
		days_stay,
		discount_stay_percentage,
		currency_amount,
		tax,
		subtotal,
		total,
		monthly_quotation,
		semiannual_quotation,
		annual_quotation,
        group_quotation,
        creation_responsable
	) values (
		_boat_id,
		_marina_quotation_status_id,
		_marina_mooring_tariff_id,
		@electricity_id,
		_arrival_date,
		_departure_date,
		_arrival_status,
		_mooring_tariff,
		_loa,
		_days_stay,
		_discount_stay_percentage,
		_currency_amount,
		_tax,
		_subtotal,
		_total,
		_monthly_quotation,
		_semiannual_quotation,
		_annual_quotation,
        _group_quotation,
        _creation_responsable
	);

	SELECT LAST_INSERT_ID() INTO @last_quotation_id;
	CALL SP_MarinaQuotationTimeline_PostTimeline(
		@last_quotation_id, 
		1, 
		CONCAT('Creacion de la cotización #', @last_quotation_id), 
		'Creación de la cotización en estado de borrador.', 
		 _creation_responsable
	);
END