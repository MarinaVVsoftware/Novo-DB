/* Table "Electronic Signature Historic"
Almacena la firma electrónica de los clientes. Por seguridad se contean
los errores al usar la firma electrónica, y se bloquea después de cierto
número de intentos. Se setea una fecha para reiniciar los intentos.

electronic_signature_id -> ID natural
client_id               -> FK con clients
electronic_signature    -> Firma electrónica
attemps                 -> Contador del número de intentos fallidos de uso
attemps_reset_date      -> Momento de reseteo de los intentos

PK = electronic_signature_id 
*/
CREATE TABLE IF NOT EXISTS electonic_signatures (
    electronic_signature_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    electronic_signature SMALLINT NOT NULL,
    attemps INT NOT NULL DEFAULT 0,
    attemps_reset_date DATETIME DEFAULT NULL,

    PRIMARY KEY (electronic_signature_id)
);