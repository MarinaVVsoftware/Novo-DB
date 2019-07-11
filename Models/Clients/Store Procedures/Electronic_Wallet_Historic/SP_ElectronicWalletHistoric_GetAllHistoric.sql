/* SP SP_ElectronicWalletHistoric_GetAllHistoric: Trae el historial de movimientos
dentro del monedero de un cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ElectronicWalletHistoric_GetAllHistoric`(
    _client_id INT
)
BEGIN
    SELECT 
        electronic_wallet_historic_id AS electronicWalletHistoricId,
        creation_date AS creationDate,
        previous_amount AS previousAmount,
        new_amount AS newAmount,
        description,
        alter_responsable AS alterResponsable
    FROM electronic_wallet_historic
    WHERE client_id = _client_id
    ORDER BY creation_date ASC;
END