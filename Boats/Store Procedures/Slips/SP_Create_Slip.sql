/* SP SP_CREATE_SLIP: Crea un slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_SLIP`(
    _slip_type_id INT,
    _slip_name VARCHAR(100)
)
BEGIN
    INSERT INTO slips(slip_type_id, slip_name)
    VALUES(_slip_type_id, _slip_name);
END