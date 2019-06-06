CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ELECTRONIC_SIGNATURE_HISTORIC`()
BEGIN
    SELECT * 
    FROM electronic_signature_historic;
END