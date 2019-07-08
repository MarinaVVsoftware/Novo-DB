/* SP SP_Clients_GetClients: Trae la lista de clientes. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Clients_GetClients`()
BEGIN
    SELECT 
       	client_id AS clientId,
        status_id AS statusId,
        name,
        email,
        phone,
        address,
        creation_date AS creationDate
    FROM clients 
    WHERE logical_deleted = 0;
END