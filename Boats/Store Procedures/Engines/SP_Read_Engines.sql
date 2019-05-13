/* SP SP_READ_ENGINES: Trae los motores. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ENGINES`()
BEGIN
    SELECT * FROM engines WHERE logical_deleted = 0;
END