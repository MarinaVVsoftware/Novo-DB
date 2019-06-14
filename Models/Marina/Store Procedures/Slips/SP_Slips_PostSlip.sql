/* SP SP_Slips_PostSlip: Crea un slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Slips_PostSlip`(
    _slip_type_id INT,
    _slip_name VARCHAR(20)
)
BEGIN
    INSERT INTO slips(slip_type_id, slip_name)
    VALUES(_slip_type_id, _slip_name);
END