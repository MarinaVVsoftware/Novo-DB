/* SP SP_CREATE_SLIP_TYPE: Crea un tipo de slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_SLIP_TYPE`(
    _slip_type VARCHAR(50)
)
BEGIN
    INSERT INTO slip_types(slip_type)
    VALUES(_slip_type);
END