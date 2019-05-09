/* SP SP_UPDATE_SLIP_OCCUPATION: Actualiza una ocupación de slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SLIP_OCCUPATION`(
    _slip_occupation_id INT,
    _slip_id INT,
    _boat_id INT,
    _start_date DATETIME,
    _end_date DATETIME,
    _creation_responsable VARCHAR(50) 
)
BEGIN
    UPDATE slips SET
        slip_id = slip_id,
        boat_id = boat_id,
        start_date = start_date,
        end_date = end_date,
        creation_responsable = creation_responsable
    WHERE 
        slip_occupation_id = _slip_occupation_id;
END