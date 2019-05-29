CREATE DEFINER
=`root`@`localhost` PROCEDURE `SP_READ_CLIENTS`
(

)
BEGIN
    SELECT *
    FROM clients
    WHERE status_id = 1;
END