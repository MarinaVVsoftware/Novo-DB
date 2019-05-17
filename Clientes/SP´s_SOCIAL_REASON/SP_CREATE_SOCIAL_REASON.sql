CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_SOCIAL_REASON`(
_client_id INT,
_email VARCHAR(50),
_social_reason VARCHAR(50),
_RCD VARCHAR(50),
_CFDI VARCHAR(50),
_address VARCHAR(50),
_status_id INT
)
BEGIN
INSERT INTO social_reason(client_id,email,social_reason,RCD,CFDI,address,status_id)
VALUE(_client_id,email,social_reason,_RCD,_CFDI,_address,_status_id);
END