/* SP SP_CREATE_SLIP_TYPE: Crea un tipo de slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_SLIP_TYPE`(
    _slip_type VARCHAR(100),
    _slip_min_ft INTEGER,
    _slip_max_ft INTEGER
)
BEGIN
    INSERT INTO slip_types (
      slip_type, 
      slip_min_ft, 
      slip_max_ft
    )
    VALUES (
      _slip_type, 
      _slip_min_ft, 
      _slip_max_ft
    );
END