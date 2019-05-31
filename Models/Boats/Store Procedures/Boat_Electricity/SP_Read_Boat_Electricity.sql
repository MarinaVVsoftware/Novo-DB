/* SP SP_READ_BOAT_ELECTRICITY: Trae las relaciones de configuraciones eléctricas. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOAT_ELECTRICITY`()
BEGIN
    SELECT * 
    FROM boat_electricity 
    WHERE logical_deleted = 0;
END