/* SP SP_CREATE_SLIP_OCCUPATION: Crea una ocupación basada en un slip y un bote. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_SLIP_OCCUPATION`(
    _slip_id INT,
    _boat_id INT,
    _start_date VARCHAR(50),
    _end_date VARCHAR(50),
    _creation_responsable VARCHAR(100) 
)
BEGIN
    INSERT INTO slips_occupation (
        slip_id,
        boat_id,
        start_date,
        end_date,
        creation_responsable
    )
    VALUES (  
        _slip_id,
        _boat_id,
        _start_date,
        _end_date,
        _creation_responsable 
    );
END