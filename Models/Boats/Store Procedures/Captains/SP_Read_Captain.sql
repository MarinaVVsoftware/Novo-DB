/* SP SP_READ_CAPTAINS: Trae el capitan de un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_CAPTAIN`(_boat_name VARCHAR(100))
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM Boats WHERE name = _boat_name AND boats.logical_deleted = 0) THEN
         /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Boat does exist. Can\'t bring back captain with no boat.";
    END IF;
    
    SELECT boat_id INTO @boat FROM boats WHERE name = _boat_name;

    SELECT * FROM captains WHERE boat_id = @boat AND logical_deleted = 0;
END