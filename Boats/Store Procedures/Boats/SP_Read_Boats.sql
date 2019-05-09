/* SP SP_READ_BOAT: Trae todos los barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_BOATS`(_id_boat INT)
BEGIN
    IF (_id_boat IS NULL) THEN 
        SELECT * FROM boats;
    ELSE
        SELECT * FROM boats WHERE boat_id = _id_boat;
    END IF;
END