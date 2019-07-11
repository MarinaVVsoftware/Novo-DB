/* SP SP_ElectronicWallet_PostWallet: Crea el monedero de un cliente,
solo sucede al crear al cliente por lo que no es necesario validar nada. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ElectronicWallet_PostWallet`(
    _client_id INT
)
BEGIN
    INSERT INTO electronic_wallet (
        client_id
    )
    VALUES (
        _client_id
    );
END