CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_CLIENTS`(
_client_id INT,
_status_id INT,
_rol_id INT,
_es_id INT,
_name VARCHAR(55),
_email VARCHAR(55),
_phone VARCHAR(50),
_address VARCHAR(100),
_creation_date DATETIME,
_e_wallet INT
)
BEGIN
UPDATE clients SET client_id = _client_id,status_id = _status_id,rol_id = _rol_id,electronic_signature_id =_es_id,
name =_name,email = _email, phone = _phone,address = _address,creation_date = _creation_date,electronic_wallet_id = _e_wallet
WHERE client_id = _client_id;
END