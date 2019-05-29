CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ELECTRONIC_SIGNATURE_HISTORIC_TYPE`
(
    _electronic_signature_historic_type_id INT,
    _type VARCHAR(100)
)
BEGIN

UPDATE Electronic_Signature_Historic_Types SET  
    type = _type
WHERE electronic_signature_historic_type_id = _electronic_signature_historic_type_id;

END