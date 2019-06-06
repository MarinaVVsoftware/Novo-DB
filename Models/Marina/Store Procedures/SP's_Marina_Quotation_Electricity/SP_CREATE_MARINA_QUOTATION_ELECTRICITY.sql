CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_MARINA_QUOTATION_ELECTRICITY`(
	_electricity_tariff DECIMAL(12,4),
	_total_days INT,
    _discount_percentage DECIMAL(12,4),
    _currency_amount DECIMAL(12,4),
    _tax DECIMAL(12,4),
    _subtotal DECIMAL(12,4),
    _total DECIMAL(12,4),
    OUT _result INT
)
BEGIN
	INSERT INTO marina_quotation_electricity (
		electricity_tariff,
		total_days,
		discount_electricity_percentage,
		currency_amount,
		tax,
		subtotal,
		total
	) VALUES (
		_electricity_tariff,
		_total_days,
		_discount_percentage,
		_currency_amount,
		_tax,
		_total,
		_subtotal
	);
    
   SELECT LAST_INSERT_ID() INTO _result;
   /*SELECT _result;*/
END