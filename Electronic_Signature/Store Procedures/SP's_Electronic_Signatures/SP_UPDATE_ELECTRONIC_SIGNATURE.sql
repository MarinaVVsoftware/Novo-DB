CREATE PROCEDURE `SP_UPDATE_ELECTRONIC_SIGNATURES`
(
    _electronic_signature_id INT,
    _signature INT,
    _attemps INT,
    _attemps_reset_date DATETIME
)
BEGIN

UPDATE Electonic_Signatures SET  
    signature = _signature,
    attemps = _attemps,
    attemps_reset_date = _attemps_reset_date
WHERE electronic_signature_id = _electronic_signature_id;

END