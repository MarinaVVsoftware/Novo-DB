/* SP SP_Clients_GetClients: Trae la lista de clientes. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Clients_GetClients`()
BEGIN
    SELECT 
       	client_id,
        status_id,
        name,
        email,
        phone,
        address,
        creation_date
    FROM clients 
    WHERE logical_deleted = 0;
END