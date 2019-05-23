CREATE PROCEDURE `SP_DELETE_ELECTRONIC_SIGNATURE_HISTORIC` ( _electronic_signature_historic_id INT )

BEGIN

DELETE FROM Electronic_Signature_Historics WHERE electronic_signature_historic_id = _electronic_signature_historic_id;

END