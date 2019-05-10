CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_BANK_ACCOUNT`(
_bank_account_id INT,
_client_id INT,
_alias VARCHAR(50),
_bank VARCHAR(50),
_account_number VARCHAR(50),
_clabe VARCHAR(50)

)
BEGIN
UPDATE bank_account SET client_id = _client_id,alias= _alias,bank = _bank,account_number = _account_number,
clabe = _clabe WHERE bank_account_id = _bank_account_id;
END