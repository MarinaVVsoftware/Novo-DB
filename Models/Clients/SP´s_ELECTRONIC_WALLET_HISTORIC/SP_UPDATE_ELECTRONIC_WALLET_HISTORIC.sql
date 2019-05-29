CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ELECTRONIC_WALLET_HISTORIC`(
_electronic_W_H_id INT,
_client_id INT,
_creation_date DATETIME,
_alter_responsable VARCHAR(100),
_description VARCHAR(255),
_previous_amount DOUBLE,
_new_amount DOUBLE

)
BEGIN
UPDATE electronic_wallet_historic SET  client_id = _client_id,creation_date = _creation_date,
alter_responsable = _alter_responsable, description = _description,previous_amount = _previous_amount,new_amount = _new_amount 
WHERE electronic_wallet_historic_id = _electronic_W_H_id;
END