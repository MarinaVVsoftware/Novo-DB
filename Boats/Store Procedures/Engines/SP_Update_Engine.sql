/* SP SP_UPDATE_ENGINE: Actualiza un motor. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ENGINE`(
    _engine_id INT,
    _boat_id INT,
    _model DATETIME,
    _brand DATETIME,
    _creation_responsable VARCHAR(100) 
)
BEGIN
    UPDATE engines SET
        boat_id = _boat_id,
        model = _model,
        brand = _brand,
        creation_responsable = _creation_responsable
    WHERE 
        engine_id = _engine_id;
END