/* SP SP_UPDATE_CABLE_TYPE: Actualiza un tipo de cable. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_CABLE_TYPE`(
    _cable_type_id INT,
    _cable_type VARCHAR(100),
    _voltage SMALLINT,
    _description VARCHAR(200),
    _price DECIMAL(12,4)

)
BEGIN
    UPDATE cable_types SET
        cable_type = _cable_type,
        voltage = _voltage,
        description = _description,
        price = _price
    WHERE cable_type_id = _cable_type_id;
END