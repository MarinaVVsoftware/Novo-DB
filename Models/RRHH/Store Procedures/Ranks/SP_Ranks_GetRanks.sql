/* SP SP_Ranks_GetRanks: Trae los tipos de Ranks. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Ranks_GetRanks`()
BEGIN
    SELECT * FROM ranks;
END