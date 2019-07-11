/* SP SP_ElectronicWalletHistoric_PostHistoric: inserta un nuevo movimiento
en el monedero del cliente. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ElectronicWalletHistoric_PostHistoric`(
    _client_id INT,
    _previous_amount DECIMAL(12,4),
    _new_amount DECIMAL(12,4),
    _description VARCHAR(200),
    _alter_responsable VARCHAR(200)
)
BEGIN
    INSERT INTO electronic_wallet_historic (
        client_id,
        description,
        previous_amount,
        new_amount,
        alter_responsable
    )
    VALUES (
        _client_id,
        _description,
        _previous_amount,
        _new_amount,
        _alter_responsable
    );
END