CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ELECTRONIC_SIGNATURE_HISTORIC` (
    _electronic_signature_historic_id INT,
    _electronic_signature_historic_type_id INT,
    _client_id INT,
    _date DATETIME,
    _alter_responsable VARCHAR(100)
)
BEGIN
    UPDATE electronic_signature_historic SET  
        electronic_signature_historic_type_id = _electronic_signature_historic_type_id,
        client_id = _client_id,
        date = _date,
        alter_responsable = alter_responsable
    WHERE electronic_signature_historic_id = _electronic_signature_historic_id;
END