/* SP SP_DELETE_ENGINE_BY_ID: Elimina un motor. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ENGINE_BY_ID`(
    _engine_id INT
)
BEGIN
    UPDATE engines SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE engine_id = _engine_id;
END