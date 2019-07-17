CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaQuotationStatus_GetStatus`()
BEGIN
    SELECT
        marina_quotation_status_id AS marinaQuotationStatusId,
        status
    FROM marina_quotations_status;
END