/* SP SP_UPDATE_SLIP_TYPE: Actualiza un tipo de slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SLIP_TYPE`(
    _slip_type_id INT,
    _slip_type VARCHAR(50)
)
BEGIN
    UPDATE slip_types SET
        slip_type = _slip_type
    WHERE 
        slip_type_id = _slip_type_id;
END