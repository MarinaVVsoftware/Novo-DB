/* SP SP_UPDATE_SLIP: Actualiza un slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SLIP`(
    _slip_id INT,
    _slip_type_id INT,
    _slip_name VARCHAR(50)
)
BEGIN
    UPDATE slips SET
        slip_type_id = _slip_type_id,
        slip_name = _slip_name
    WHERE 
        slip_id = _slip_id;
END