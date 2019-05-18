/* SP SP_DELETE_CAPTAIN: Elimina un capitán */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CAPTAIN`(_captain_id INT)
BEGIN
    DELETE FROM captains WHERE captain_id = _captain_id;
END