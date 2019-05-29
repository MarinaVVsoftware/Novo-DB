/* SP SP_CREATE_ENGINE: Crea un engine. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_ENGINE`(
    _boat_id INT,
    _model VARCHAR(100),
    _brand VARCHAR(100)
)
BEGIN
    INSERT INTO engines(boat_id, model, brand)
    VALUES(_boat_id, _model, _brand);
END