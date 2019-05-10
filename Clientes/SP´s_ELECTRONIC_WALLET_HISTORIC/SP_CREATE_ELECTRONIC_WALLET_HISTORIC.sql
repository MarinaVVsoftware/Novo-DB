CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_ELECTRONIC_WALLET_HISTORIC`(
_client_id INT,
_creation_date DATETIME,
_alter_responsable VARCHAR(100),
_descripcion VARCHAR(255),
_previous_amount DOUBLE,
_new_amount DOUBLE
)
BEGIN
INSERT INTO electronic_wallet_historic (client_id,creation_date,alter_responsable,description,previous_amount,new_amount)
VALUE(_client,_creation_date,_alter_responsable,_description,_previous_amount,_new_amount);
END