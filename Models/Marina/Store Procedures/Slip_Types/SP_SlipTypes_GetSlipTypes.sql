/* SP SP_SlipTypes_GetSlipTypes: Trae los tipos de slips almacenados. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SlipTypes_GetSlipTypes`()
BEGIN
    SELECT
        slip_type_id AS slipTypeId,
        slip_type AS slipType,
        slip_min_ft AS slipMinFt,
        slip_max_ft AS slipMaxFt
    FROM slip_types 
    WHERE logical_deleted = 0
    ORDER BY slip_type_id ASC;
END