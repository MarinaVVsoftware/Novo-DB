/* tabla boat_document_types */
DROP PROCEDURE IF EXISTS SP_BoatDocumentTypes_GetTypes;
DROP PROCEDURE IF EXISTS SP_BoatDocumentTypes_PostDocumentType;

/* tabla boat_documents */
DROP PROCEDURE IF EXISTS SP_BoatDocuments_DeleteByBoat;
DROP PROCEDURE IF EXISTS SP_BoatDocuments_GetByBoat;
DROP PROCEDURE IF EXISTS SP_BoatDocuments_GetByClient;
DROP PROCEDURE IF EXISTS SP_BoatDocuments_PutByBoat;

/* tabla boat_electricity */
DROP PROCEDURE IF EXISTS SP_BoatElectricity_DeleteByBoat;
DROP PROCEDURE IF EXISTS SP_BoatElectricity_DeleteByElectricityId;
DROP PROCEDURE IF EXISTS SP_BoatElectricity_GetByBoat;
DROP PROCEDURE IF EXISTS SP_BoatElectricity_GetByClient;
DROP PROCEDURE IF EXISTS SP_BoatElectricity_PostByBoat;
DROP PROCEDURE IF EXISTS SP_BoatElectricity_PutByElectricityId;

/* tabla boats */
DROP PROCEDURE IF EXISTS SP_Boats_DeleteBoat;
DROP PROCEDURE IF EXISTS SP_Boats_GetByClient;
DROP PROCEDURE IF EXISTS SP_Boats_PatchBoat;
DROP PROCEDURE IF EXISTS SP_Boats_PutBoat;

/* tabla cable_types */
DROP PROCEDURE IF EXISTS SP_CableTypes_GetTypes;
DROP PROCEDURE IF EXISTS SP_CableTypes_PostCableType;

/* tabla captains */
DROP PROCEDURE IF EXISTS SP_Captains_DeleteByBoat;
DROP PROCEDURE IF EXISTS SP_Captains_GetByBoat;
DROP PROCEDURE IF EXISTS SP_Captains_PutByBoat;

/* tabla engines */
DROP PROCEDURE IF EXISTS SP_Engines_DeleteByBoat;
DROP PROCEDURE IF EXISTS SP_Engines_DeleteById;
DROP PROCEDURE IF EXISTS SP_Engines_GetByBoat;
DROP PROCEDURE IF EXISTS SP_Engines_GetByClient;
DROP PROCEDURE IF EXISTS SP_Engines_PostByBoat;
DROP PROCEDURE IF EXISTS SP_Engines_PutEngineById;

/* tabla responsible */
DROP PROCEDURE IF EXISTS SP_Responsible_DeleteByBoat;
DROP PROCEDURE IF EXISTS SP_Responsible_GetByBoat;
DROP PROCEDURE IF EXISTS SP_Responsible_PutByBoat;

/* tabla socket_types */
DROP PROCEDURE IF EXISTS SP_SocketTypes_GetTypes;
DROP PROCEDURE IF EXISTS SP_SocketTypes_PostSocketType;




