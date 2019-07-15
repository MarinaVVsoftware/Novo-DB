CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotations_GetQuotationsByGroup`(
    _filterBy VARCHAR(30)
)
BEGIN
    SELECT 
        mq.marina_quotation_id, 
        mq.marina_quotation_status_id,
        mq.creation_date,
        mq.creation_responsable,
        bt.name AS boat_name,
        mq.boat_id,
        ct.name AS client_name,
        ct.client_id,
        mq.arrival_date,
        mq.departure_date,
        mq.days_stay,
        mq.loa,
        bt.draft,
        bt.beam,
        mq.discount_stay_percentage,
        mq.tax,
        mq.subtotal,
        mq.total,
        mq.monthly_quotation,
        mq.annual_quotation,
        mq.semiannual_quotation,
        mq.creation_responsable,
        mq.creation_date
    FROM marina_quotations mq
    INNER JOIN boats bt ON mq.boat_id = bt.boat_id
    INNER JOIN clients ct on bt.client_id = ct.client_id
    WHERE FIND_IN_SET(mq.marina_quotation_status_id, _filterBy) > 0;
END