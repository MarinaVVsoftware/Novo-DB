CREATE PROCEDURE `SP_DELETE_MARINA_SERVICE` ( _marina_service_id INT )

BEGIN

DELETE FROM Marina_Services WHERE marina_service_id = _marina_service_id;

END