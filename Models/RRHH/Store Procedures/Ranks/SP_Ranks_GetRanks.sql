/* SP SP_Ranks_GetRanks: Trae los tipos de Ranks. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Ranks_GetRanks`()
BEGIN
    SELECT 
        rank_id AS rankId,
        rank_name AS rankName,
        rank_weight AS rankWeight
    FROM ranks;
END