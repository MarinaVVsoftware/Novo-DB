CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ELECTRONIC_SIGNATURE_HISTORIC_TYPE` (
    _electronic_signature_historic_type_id INT
)
BEGIN
    DELETE FROM electronic_signature_historic_types 
    WHERE electronic_signature_historic_type_id = _electronic_signature_historic_type_id;
END