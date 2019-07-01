/* Primero las tablas débiles */
TRUNCATE TABLE electronic_signature_historic_types;

/* Estas tablas dependen de Clients */
TRUNCATE TABLE electronic_signature_historic;
TRUNCATE TABLE electronic_signatures;
TRUNCATE TABLE electronic_wallet;
TRUNCATE TABLE electronic_wallet_historic;

TRUNCATE TABLE bank_accounts;
TRUNCATE TABLE social_reasons;

/* Tabla Padre */
TRUNCATE TABLE clients;