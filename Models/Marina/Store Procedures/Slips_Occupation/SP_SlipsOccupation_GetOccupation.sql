/* SP SP_SlipsOccupation_GetOccupation: Trae la ocupación de slips. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SlipsOccupation_GetOccupation`()
BEGIN
    /* Devuelve las ocupaciones, haciendo join de los datos de slip con la ocupación */
    SELECT 
        _slips_occupation.slip_occupation_id AS slipOccupationId,
        _slips.slip_id AS slipId,
        _slips.slip_name AS slipName,
        _slips.slip_type_id AS slipType,
        _slips_occupation.marina_quotation_id AS slipQuotationId,
        _slips_occupation.start_date AS startDate,
        _slips_occupation.end_date AS endDate,
        _slips_occupation.creation_date AS creationDate
    FROM slips_occupation AS _slips_occupation
    LEFT OUTER JOIN slips AS _slips
    ON (_slips.slip_id = _slips_occupation.slip_id)
    WHERE _slips_occupation.logical_deleted = 0
    ORDER BY _slips.slip_id ASC,
    _slips_occupation.start_date ASC;
END