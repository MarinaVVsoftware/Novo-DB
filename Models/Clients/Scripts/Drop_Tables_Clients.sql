/* Primero las tablas débiles */
DROP TABLE IF EXISTS electronic_signature_historic_types;

/* Estas tablas dependen de Clients */
DROP TABLE IF EXISTS electronic_signature_historic;
DROP TABLE IF EXISTS electronic_signatures;
DROP TABLE IF EXISTS electronic_wallet;
DROP TABLE IF EXISTS electronic_wallet_historic;

DROP TABLE IF EXISTS bank_accounts;
DROP TABLE IF EXISTS social_reasons;

/* Tabla Padre */
DROP TABLE IF EXISTS clients;