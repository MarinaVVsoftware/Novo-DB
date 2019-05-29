CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_CLIENTS`(
    _status_id INT,
    _rol_id INT,
    _es_id INT,
    _name VARCHAR(55),
    _email VARCHAR(55),
    _phone VARCHAR(50),
    _address VARCHAR(100),
    _e_wallet INT
)

BEGIN
    INSERT INTO clients(
        status_id,
        rol_id,
        electronic_signature_id,
        name,
        email,
        phone,
        address,
        creation_date,
        electronic_wallet_id
    )
    VALUES(
        _status_id,
        _rol_id,
        _es_id,
        _name,
        _email,
        _phone,
        _address,
        NOW(),
        _e_wallet
    );
END