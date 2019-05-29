CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_MARINA_QUOTATIONS_LIST`()

BEGIN
        SELECT 
        mq.marina_quotation_id, 
        mq.marina_quotation_status_id,
        mq.creation_date,
        mq.creation_responsable,
        bt.name AS boat_name,
        bt.boat_id,
        ct.name AS client_name,
        ct.client_id,
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
    WHERE mq.logical_deleted = 0 AND find_in_set(mq.marina_quotation_status_id, _filterBy) > 0;
END