/* SP SP_CREATE_SLIP: Crea un slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_SLIP`(
    _slip_type_id INT
)
BEGIN
    INSERT INTO slips(slip_type_id)
    VALUES(_slip_type_id);
END