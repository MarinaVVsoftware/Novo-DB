/* SP SP_READ_CABLE_TYPES: Trae los tipos de cables. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_CABLE_TYPES`()
BEGIN
    SELECT * FROM cable_types WHERE logical_deleted = 0;
END