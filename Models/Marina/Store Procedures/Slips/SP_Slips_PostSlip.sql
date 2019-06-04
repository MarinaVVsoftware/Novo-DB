/* SP SP_Slips_PostSlip: Crea un slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Slips_PostSlip`(
    _slip_type_id INT
)
BEGIN
    INSERT INTO slips(slip_type_id)
    VALUES(_slip_type_id);
END