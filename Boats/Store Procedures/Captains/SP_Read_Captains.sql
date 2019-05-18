/* SP SP_READ_CAPTAINS: Trae los capitanes. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_CAPTAINS`()
BEGIN
    SELECT * FROM captains;
END