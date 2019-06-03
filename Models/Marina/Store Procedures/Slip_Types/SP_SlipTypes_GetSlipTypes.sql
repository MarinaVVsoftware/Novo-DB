/* SP SP_SlipTypes_GetSlipTypes: Trae los tipos de slips almacenados. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SlipTypes_GetSlipTypes`()
BEGIN
    SELECT
        slip_type_id,
        slip_type,
        slip_min_ft,
        slip_max_ft
    FROM slip_types 
    WHERE logical_deleted = 0;
END