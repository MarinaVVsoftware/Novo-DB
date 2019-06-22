/* Table "Electronic Wallet"
Almacena el monedero electrónico del cliente, separado por
departamentos.

electronic_wallet_id    -> ID natural
marina_amount           -> Monto del monedero para Marina

PK = social_reason_id 
*/
 CREATE TABLE IF NOT EXISTS electronic_wallet (
	electronic_wallet_id INT NOT NULL AUTO_INCREMENT,
    marina_amount DECIMAL(12,4) NOT NULL,

    PRIMARY KEY (electronic_wallet_id)
);