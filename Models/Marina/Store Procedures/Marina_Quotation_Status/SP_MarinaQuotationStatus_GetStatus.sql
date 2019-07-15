CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_MARINA_QUOTATION_STATUS`()
BEGIN
    SELECT
        marina_quotation_status_id AS marinaQuotationStatusId,
        status
    FROM SP_MarinaQuotationStatus_GetStatus;
END