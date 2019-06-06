CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ELECTRONIC_SIGNATURES` ( _electronic_signature_id INT )

BEGIN

DELETE FROM electonic_signatures WHERE electronic_signature_id = _electronic_signature_id;

END