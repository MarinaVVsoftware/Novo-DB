/* SP SP_Status_GetStatus: Trae los tipos de Status. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Status_GetStatus`()
BEGIN
    SELECT * FROM status 
    ORDER BY status_id ASC;
END