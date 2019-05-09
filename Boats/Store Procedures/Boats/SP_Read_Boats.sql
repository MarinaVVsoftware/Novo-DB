/* SP SP_READ_BOAT: Trae todos los barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOATS`()
BEGIN
    SELECT * FROM boats WHERE logical_deleted = 0;
END