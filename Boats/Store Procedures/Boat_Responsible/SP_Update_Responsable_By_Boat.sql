/* SP SP_UPDATE_RESPONSABLE_BY_BOAT: Actualiza el responsable de un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_RESPONSABLE_BY_BOAT`(
    _boat_name VARCHAR(100),
    _name VARCHAR(100),
    _phone VARCHAR(15),
    _email VARCHAR(100),
    _payment_permission BOOLEAN,
    _aceptation_permission BOOLEAN
)
BEGIN
    /* verifica que exista el bote. de lo contrario tira una excepción. */
    IF NOT EXISTS (SELECT 1 FROM boats WHERE name = _boat_name AND logical_deleted = 0) THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Boat does exist. Can't bring back captain with no boat.";
    END IF;
    
    SELECT boat_id INTO @boat FROM boats WHERE name = _boat_name;

    /* verifica que exista el responsable. si no existe, lo crea. */
    IF NOT EXISTS (SELECT 1 FROM responsible WHERE boat_id = @boat AND logical_deleted = 0) THEN
        INSERT INTO responsible(boat_id, name, phone, email, payment_permission, aceptation_permission)
        VALUES(@boat, _name, _phone, _email, _payment_permission, _aceptation_permission);
    ELSE
        /* obtiene el id del responsable para modificarlo */
        SELECT responsable_id INTO @responsable 
        FROM responsible 
        WHERE boat_id = @boat 
        AND logical_deleted = 0;

        UPDATE responsible SET
            boat_id = @boat,
            name = _name,
            phone = _phone,
            email = _email,
            payment_permission = _payment_permission,
            aceptation_permission = _aceptation_permission
        WHERE 
            responsable_id = @responsable;
    END IF;
END