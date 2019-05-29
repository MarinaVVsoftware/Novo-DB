CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CLIENTS`(
_client_id INT
)
BEGIN
DELETE FROM clients WHERE client_id = _client_id;
END