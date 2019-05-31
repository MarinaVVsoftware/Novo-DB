/* SP SP_DELETE_SLIP: Elimina un slip. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_SLIP`(
    _slip_id INT
)
BEGIN
     UPDATE slips SET
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE slip_id = _slip_id;
END