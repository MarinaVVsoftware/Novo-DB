CREATE DEFINER
=`root`@`localhost` PROCEDURE `SP_LOGICAL_DELETE_SOCIAL_REASON`
( _social_reason_id INT)
BEGIN
    UPDATE social_reason SET Logical_Delete = 1 WHERE social_reason_id =_social_reason_id;
END