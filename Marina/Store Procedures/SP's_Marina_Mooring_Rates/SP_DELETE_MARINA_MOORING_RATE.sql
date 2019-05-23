CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_MARINA_MOORING_RATE` ( _marina_mooring_rate_id INT )

BEGIN

DELETE FROM Marina_Mooring_Rates WHERE marina_mooring_rate_id = _marina_mooring_rate_id;

END