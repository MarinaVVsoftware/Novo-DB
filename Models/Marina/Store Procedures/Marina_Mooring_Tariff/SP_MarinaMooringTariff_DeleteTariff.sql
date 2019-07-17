/* SP SP_MarinaMooringTariff_DeleteTariff: Elimina una tarifa. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MarinaMooringTariff_DeleteTariff`(
    _marina_mooring_tariff_id INT
)
BEGIN
    /* verifica que exista la tarifa a modificar. de lo contrario tira una excepción. */
    IF NOT EXISTS (
        SELECT 1 FROM marina_mooring_tariff 
        WHERE marina_mooring_tariff_id = _marina_mooring_tariff_id
        AND logical_deleted = 0
    )
    THEN
        /* Arroja un error customizado */
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Mooring tariff type status was not found. Can't post tariff without a mooring tariff type valid.";
    END IF;

    UPDATE marina_mooring_tariff SET 
        logical_deleted = 1,
        logical_deleted_date = NOW()
    WHERE marina_mooring_tariff_id = _marina_mooring_tariff_id;

END