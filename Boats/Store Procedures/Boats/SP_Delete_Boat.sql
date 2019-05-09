/* SP SP_DELETE_BOAT: Elimina un barco */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_BOAT`(_boat_id INT)
BEGIN
    DELETE FROM boats WHERE boat_id = _boat_id;
END