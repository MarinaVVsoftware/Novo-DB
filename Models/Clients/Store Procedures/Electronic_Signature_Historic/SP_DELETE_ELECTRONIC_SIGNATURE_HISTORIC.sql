CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ELECTRONIC_SIGNATURE_HISTORIC` (
    _electronic_signature_historic_id INT
)
BEGIN
    DELETE FROM electronic_signature_historic 
    WHERE electronic_signature_historic_id = _electronic_signature_historic_id;
END