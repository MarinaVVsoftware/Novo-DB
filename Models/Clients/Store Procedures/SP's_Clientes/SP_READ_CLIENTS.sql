CREATE DEFINER
=`root`@`localhost` PROCEDURE `SP_READ_CLIENTS`
(

)
BEGIN
    SELECT *
    FROM clients
    WHERE Logical_Delete = 0;
END