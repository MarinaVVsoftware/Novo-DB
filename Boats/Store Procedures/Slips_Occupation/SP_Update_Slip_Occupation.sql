/* SP SP_UPDATE_SLIP_OCCUPATION: Actualiza una ocupación de slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SLIP_OCCUPATION`(
    _slip_occupation_id INT,
    _slip_id INT,
    _boat_id INT,
    _start_date DATETIME,
    _end_date DATETIME,
    _creation_responsable VARCHAR(100) 
)
BEGIN
    UPDATE slips_occupation SET
        slip_id = _slip_id,
        boat_id = _boat_id,
        start_date = _start_date,
        end_date = _end_date,
        creation_responsable = _creation_responsable
    WHERE 
        slip_occupation_id = _slip_occupation_id;
END