/* SP SP_CableTypes_PostCableType: Crea un tipo de cable eléctrico. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CableTypes_PostCableType`(
    _cable_type VARCHAR(100),
    _voltage SMALLINT,
    _description VARCHAR(200),
    _price DECIMAL(12,4)
)
BEGIN
    INSERT INTO cable_types (
        cable_type, 
        voltage, 
        description, price
    )
    VALUES (
        _cable_type, 
        _voltage, 
        _description, _price
    );
END