CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_MARINA_MOORING_RATE_TYPE` ( _marina_mooring_rate_type_id INT )

BEGIN

DELETE FROM Marina_Mooring_Rates_Types WHERE marina_mooring_rate_type_id = _marina_mooring_rate_type_id;

END