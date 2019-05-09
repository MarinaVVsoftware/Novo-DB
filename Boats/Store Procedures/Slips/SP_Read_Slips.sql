/* SP SP_READ_SLIPS: Trae los slips. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_SLIPS`()
BEGIN
    SELECT * FROM slips WHERE logical_deleted = 0;
END