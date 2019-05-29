/* SP SP_UPDATE_SLIP_TYPE: Actualiza un tipo de slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SLIP_TYPE`(
    _slip_type_id INT,
    _slip_type VARCHAR(100),
    _slip_min_ft INTEGER,
    _slip_max_ft INTEGER
)
BEGIN
    UPDATE slip_types SET
        slip_type = _slip_type,
        slip_min_ft = _slip_min_ft,
        slip_max_ft = _slip_max_ft
    WHERE 
        slip_type_id = _slip_type_id;
END