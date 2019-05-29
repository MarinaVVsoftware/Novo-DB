CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_MARINA_MOORING_RATE`()

BEGIN

SELECT * FROM Marina_Mooring_Rates WHERE logical_deleted != 1;

END