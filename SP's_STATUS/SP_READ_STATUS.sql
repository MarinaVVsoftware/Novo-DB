/*/*STORE PROCEDURE PARA LA LECTURA DE DATOS DENTRO DE LA TABLA STATUS*/
CREATE PROCEDURE `SP_READ_STATUS`()
BEGIN
/*CONSULTA A LA BD*/
SELECT * FROM status;
END