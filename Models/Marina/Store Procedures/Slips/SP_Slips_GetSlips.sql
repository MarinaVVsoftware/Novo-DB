/* SP SP_Slips_GetSlips: Trae los slips. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Slips_GetSlips`()
BEGIN
    SELECT slip_id, slip_type_id, slip_name
    FROM slips 
    WHERE logical_deleted = 0;
END