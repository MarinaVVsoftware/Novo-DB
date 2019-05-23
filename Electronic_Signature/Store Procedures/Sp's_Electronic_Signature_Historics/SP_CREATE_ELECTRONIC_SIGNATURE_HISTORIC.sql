CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_ELECTRONIC_SIGNATURE_HISTORIC`
(
    _electronic_signature_historic_type_id INT,
    _client_id INT,
    _date DATETIME,
    _alter_responsable VARCHAR(100)
)

BEGIN

INSERT INTO Electronic_Signature_Historics
(
    electronic_signature_historic_type_id,
    client_id,
    date,
    alter_responsable
)
VALUES
(
    _electronic_signature_historic_type_id,
    _client_id,
    _date,
    _alter_responsable
);

END