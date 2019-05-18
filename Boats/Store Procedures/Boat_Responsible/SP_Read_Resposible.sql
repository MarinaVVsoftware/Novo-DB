/* SP SP_READ_RESPONSIBLE: Trae los responsables de barcos. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_RESPONSIBLE`()
BEGIN
    SELECT * FROM responsible;
END