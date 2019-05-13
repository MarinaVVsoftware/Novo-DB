/* SP SP_READ_SLIP_TYPES: Trae los tipos de slips almacenados. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_SLIP_TYPES`()
BEGIN
    SELECT * FROM slip_types WHERE logical_deleted = 0;
END