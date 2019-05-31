CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_MARINA_QUOTATION`(
    _quotation_id INT
)

BEGIN
    
    SELECT
        mq.marina_quotation_id,
        mq.boat_id,
        mq.marina_quotation_status_id,
        mq.marina_quotation_electricity_id,
        bt.name AS boat_name,
        bt.model as boat_model,
        bt.draft as boat_draft,
        bt.beam as boat_draft,
        mq.loa as boat_loa,
        ct.name AS client_name,
        ct.email AS client_email,
        ct.phone AS client_phone,
        ct.address AS client_address,
        mq.arrival_date,
        mq.departure_date,
        mq.arrival_status,
        mq.mooring_tariff,
        mq.days_stay,
        mq.discount_stay_percentage,
        mq.currency_amount,
        mq.tax,
        mq.subtotal,
        mq.total,
        mq.monthly_quotation,
        mq.annual_quotation,
        mq.semiannual_quotation,
        mq.creation_responsable,
        mq.creation_date,
        mqs.status,
        mmt.name AS marina_mooring_name,
        mmt.description AS marina_mooring_description,
        mmt.ft_min AS marina_ft_min,
        mmt.ft_max AS marina_ft_max
    FROM marina_quotations mq
    INNER JOIN boats bt ON mq.boat_id = bt.boat_id
    INNER JOIN clients ct ON bt.client_id = ct.client_id
    INNER JOIN marina_quotation_status mqs ON mq.marina_quotation_status_id = mqs.marina_quotation_status_id
    INNER JOIN marina_mooring_tariff mmt ON mq.marina_mooring_tariff_id = mmt.marina_mooring_tariff_id
    WHERE mq.marina_quotation_id = _quotation_id;

END