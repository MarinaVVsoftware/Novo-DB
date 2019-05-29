CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_BANK_ACCOUNT`(
_client_id INT,
_alias VARCHAR(50),
_bank VARCHAR(50),
_account_number VARCHAR(50),
_clabe VARCHAR(50),
_status_id INT 
)
BEGIN
INSERT INTO bank_account (client_id,alias,bank,account_number,clabe,status_id)
VALUE(_client_id,_alias,_bank,_account_number,_clabe,_status_id);
END