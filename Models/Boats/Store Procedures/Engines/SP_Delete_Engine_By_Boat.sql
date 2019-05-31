/* SP SP_DELETE_ENGINE_BY_BOAT: Elimina todos los motores de un barco. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ENGINE_BY_BOAT`(
    _boat_id INT
)
BEGIN
    UPDATE engines SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE boat_id = _boat_id;
END