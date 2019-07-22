/* SP SP_ElectronicWallet_PatchMarinaAmount: Actualiza el total de marina. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ElectronicWallet_PatchMarinaAmount`(
    _client_id INT,
    _marina_amount DECIMAL(12,4)
)
BEGIN
    /* verifica que exista el cliente. de lo contrario tira una excepción. */   
    IF NOT EXISTS (
        SELECT 1 FROM clients
        WHERE client_id = _client_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000";
    END IF;

    UPDATE electronic_wallet SET 
        marina_amount = _marina_amount
    WHERE client_id = _client_id;
END