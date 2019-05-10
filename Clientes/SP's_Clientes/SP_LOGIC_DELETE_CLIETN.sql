CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIC_DELETE_CLIETN`(
_client_id INT
)
BEGIN
UPDATE clients SET status_id = 0 WHERE client_id = _client_id;
END