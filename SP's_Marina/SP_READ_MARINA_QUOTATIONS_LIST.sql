CREATE PROCEDURE `SP_READ_MARINA_QUOTATIONS_LIST`()

BEGIN
    SELECT 
        mq.marina_quotation_id, 
        mq.creation_date,
        mq.creation_responsable,
        bt.name, 
        ct.name,
        mq.arrival_date,
        mq.departure_date,
        mq.days_stay,
        bt.loa,
        bt.draft,
        bt.beam,
        mq.discount_stay,
        mq.tax,
        mq.total,
        mq.subtotal
    FROM marina_quotations mq
    INNER JOIN boats bt ON mq.boat_id = bt.boat_id
    INNER JOIN clients ct on bt.client_id = ct.client_id
    WHERE mq.logical_deleted = 0;
END