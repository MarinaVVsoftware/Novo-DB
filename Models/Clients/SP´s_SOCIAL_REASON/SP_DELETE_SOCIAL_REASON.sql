CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_SOCIAL_REASON`(_social_reason_id INT)
BEGIN
DELETE  FROM social_reason WHERE social_reason_id = _social_reason_id;
END