/* SP SP_UPDATE_ENGINE: Actualiza un motor. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ENGINE`(
    _engine_id INT,
    _boat_id INT,
    _model VARCHAR(100),
    _brand VARCHAR(100)
)
BEGIN
    UPDATE engines SET
        boat_id = _boat_id,
        model = _model,
        brand = _brand
    WHERE 
        engine_id = _engine_id;
END