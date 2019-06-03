CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_MARINA_QUOTATION`(
    _quotation_id INT
)
BEGIN
	SET @quotation_period := 'Cotización Mensual';
    SELECT IF(semiannual_quotation = 1, @quotation_period := 'Cotización Semestral', @quotation_period) FROM marina_quotations WHERE marina_quotation_id = _quotation_id;
    SELECT IF(annual_quotation = 1, @quotation_period := 'Cotización Anual', @quotation_period) FROM marina_quotations WHERE marina_quotation_id = _quotation_id;
    
    SELECT
        mq.marina_quotation_id,
        mq.boat_id,
        mq.marina_quotation_status_id,
        mq.marina_quotation_electricity_id,
        bt.name AS boat_name,
        mq.loa as boat_loa,
        ct.name AS client_name,
        ct.email AS client_email,
        ct.phone AS client_phone,
        mq.arrival_date,
        mq.departure_date,
        mq.mooring_tariff,
        mq.days_stay,
        mq.discount_stay_percentage,
        mq.subtotal,
        mq.total,
        @quotation_period AS quotation_period,
        mq.creation_responsable,
        mq.creation_date,
        mqs.status,
        mmt.name AS marina_mooring_name,
        mmt.ft_min AS marina_ft_min,
        mmt.ft_max AS marina_ft_max
    FROM marina_quotations mq
    INNER JOIN boats bt ON mq.boat_id = bt.boat_id
    INNER JOIN clients ct ON bt.client_id = ct.client_id
    INNER JOIN marina_quotation_status mqs ON mq.marina_quotation_status_id = mqs.marina_quotation_status_id
    INNER JOIN marina_mooring_tariff mmt ON mq.marina_mooring_tariff_id = mmt.marina_mooring_tariff_id
    WHERE mq.marina_quotation_id = _quotation_id;

END