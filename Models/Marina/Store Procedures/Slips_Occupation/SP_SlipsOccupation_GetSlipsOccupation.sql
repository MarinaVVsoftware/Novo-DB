/* SP SP_READ_SLIPS_OCCUPATION: Trae la ocupación de slips. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SlipsOccupation_GetSlipsOccupation`()
BEGIN
    /* Devuelve las ocupaciones, haciendo join de los datos de slip con la ocupación */
    SELECT 
        _slips_occupation.slip_occupation_id,
        _slips.slip_id,
        _slips.slip_name,
        _slips.slip_type_id,
        _slips_occupation.marina_quotation_id,
        _slips_occupation.start_date,
        _slips_occupation.end_date,
        _slips_occupation.creation_date
    FROM slips_occupation AS _slips_occupation
    LEFT OUTER JOIN slips AS _slips
    ON (_slips.slip_id = _slips_occupation.slip_id)
    WHERE _slips_occupation.logical_deleted = 0
    ORDER BY _slips.slip_id ASC;
END