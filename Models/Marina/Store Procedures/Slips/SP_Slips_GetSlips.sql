/* SP SP_Slips_GetSlips: Trae los slips. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Slips_GetSlips`()
BEGIN
    SELECT 
    slip_id AS slipId, 
    slip_type_id AS slipType, 
    slip_name AS slipName
    FROM slips 
    WHERE logical_deleted = 0
    ORDER BY slip_id ASC;
END