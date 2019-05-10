CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SOCIAL_REASON`(
_social_reason_id INT,
_client_id INT,
_email VARCHAR(50),
_social_reason VARCHAR(50),
_RFC VARCHAR(50),
_CFDI VARCHAR(50),
_addres VARCHAR(50)
)
BEGIN
UPDATE social_reason SET client_id = _client_id,email = _email,social_reason = _social_reason,RFC = _RFC,CFDI = _CFDI,address = _address 
WHERE social_reason_id = _social_reason_id;
END