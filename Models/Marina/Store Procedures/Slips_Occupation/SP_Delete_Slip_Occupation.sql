/* SP SP_DELETE_SLIP_OCCUPATION: Elimina un slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_SLIP_OCCUPATION`(
    _slip_occupation_id INT
)
BEGIN
     UPDATE slips_occupation SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE slip_occupation_id = _slip_occupation_id;
END