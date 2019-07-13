/* table bank_accounts */
DROP PROCEDURE IF EXISTS SP_BankAccounts_DeleteBankAccount;
DROP PROCEDURE IF EXISTS SP_BankAccounts_GetBankAccounts;
DROP PROCEDURE IF EXISTS SP_BankAccounts_PutBankAccount;

/* table clients */
DROP PROCEDURE IF EXISTS SP_Clients_DeleteClient;
DROP PROCEDURE IF EXISTS SP_Clients_GetClientById
DROP PROCEDURE IF EXISTS SP_Clients_GetClients;
DROP PROCEDURE IF EXISTS SP_Clients_PostClient;
DROP PROCEDURE IF EXISTS SP_Clients_PutClient;

/* table electronic_wallet */
DROP PROCEDURE IF EXISTS SP_ElectronicWallet_GetWallet;
DROP PROCEDURE IF EXISTS SP_ElectronicWallet_PatchMarinaAmount;
DROP PROCEDURE IF EXISTS SP_ElectronicWallet_PostWallet;

/* table electronic_wallet_historic */
DROP PROCEDURE IF EXISTS SP_ElectronicWalletHistoric_GetAllHistoric;
DROP PROCEDURE IF EXISTS SP_ElectronicWalletHistoric_PostHistoric;

/* table social_reasons */
DROP PROCEDURE IF EXISTS SP_SocialReasons_DeleteSocialReason;
DROP PROCEDURE IF EXISTS SP_SocialReasons_GetSocialReasons;
DROP PROCEDURE IF EXISTS SP_SocialReasons_PutSocialReason;
