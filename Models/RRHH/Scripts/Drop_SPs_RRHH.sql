/* Incident Types */
DROP PROCEDURE IF EXISTS SP_IncidentTypes_GetTypes;

/* Incidents */
DROP PROCEDURE IF EXISTS SP_Incidents_DeleteById;
DROP PROCEDURE IF EXISTS SP_Incidents_DeleteByUser;
DROP PROCEDURE IF EXISTS SP_Incidents_GetIncidents;
DROP PROCEDURE IF EXISTS SP_Incidents_PostIncident;
DROP PROCEDURE IF EXISTS SP_Incidents_PutById;

/* Ranks */
DROP PROCEDURE IF EXISTS SP_Ranks_GetRanks;

/* Roles */
DROP PROCEDURE IF EXISTS SP_Roles_DeleteByName;
DROP PROCEDURE IF EXISTS SP_Roles_GetRolByUser;
DROP PROCEDURE IF EXISTS SP_Roles_GetRoles;
DROP PROCEDURE IF EXISTS SP_Roles_PutRolByName;

/* Status */
DROP PROCEDURE IF EXISTS SP_Status_GetStatus;

/* Users */
DROP PROCEDURE IF EXISTS SP_Users_DeleteByEmail;
DROP PROCEDURE IF EXISTS SP_Users_GetUserByName;
DROP PROCEDURE IF EXISTS SP_Users_GetUsers;
DROP PROCEDURE IF EXISTS SP_Users_PutByName;
