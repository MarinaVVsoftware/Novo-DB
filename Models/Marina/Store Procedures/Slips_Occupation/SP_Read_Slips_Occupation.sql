/* SP SP_READ_SLIPS_OCCUPATION: Trae la ocupación de slips. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_SLIPS_OCCUPATION`()
BEGIN
    SELECT * FROM slips_occupation WHERE logical_deleted = 0;
END