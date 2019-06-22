/* Table "Electronic Wallet Historic"
Almacena el historial de movimientos del monedero electrónico.
Dado que se mueve dinero, es importante mantener un registro de los
movimientos y los montos.

electronic_wallet_historic_id   -> ID natural
client_id                       -> FK del cliente
description                     -> Descripción del movimiento
previous_amount                 -> Antiguo monto del movimiento
new_amount                      -> Nuevo monto del movimiento
alter_responsable               -> Responsable del movimiento
creation_date                   -> Fecha de creación del row

PK = electronic_wallet_historic_id 
*/
 CREATE TABLE IF NOT EXISTS electronic_wallet_historic (
	electronic_wallet_historic_id INT NOT NULL AUTO_INCREMENT,
    client_id DECIMAL(12,4) NOT NULL,
    description VARCHAR(200),
    previous_amount DECIMAL(12,4) NOT NULL
    new_amount DECIMAL(12,4) NOT NULL,
    alter_responsable VARCHAR(200) NOT NULL,
    creation_date DATETIME DEFAULT NOW(),

    PRIMARY KEY (electronic_wallet_historic_id)
);