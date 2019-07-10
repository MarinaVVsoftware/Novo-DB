/* Table "Social Reasons"
Almacena las razones sociales de los clientes.

social_reason_id    -> ID natural
client_id           -> FK con cliente
rfc                 -> RFC
social_reason       -> Razón social
cfdi                -> CFDI
email               -> Email de la razón social
address             -> Dirección asociada a la razón social
logic_deleted       -> Borrado lógico
logic_deleted_date  -> Fecha de borrado lógico

PK = social_reason_id 
*/
 CREATE TABLE IF NOT EXISTS social_reasons (
	social_reason_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    rfc VARCHAR(50) UNIQUE NOT NULL,
    social_reason VARCHAR(200) NOT NULL,
    cfdi VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR (300) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY (social_reason_id)
);