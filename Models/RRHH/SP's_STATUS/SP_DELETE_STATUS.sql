/*/*STORE PROCEDURE PARA ELIMINAR DATOS DENTRO DE LA TABLA STATUS*/
CREATE PROCEDURE `SP_DELETE_STATUS`
/*DECLARACIÓN DE VARIBLES*/
(_Id_Status INT)
BEGIN
/*CONSULTA A LA BD*/
DELETE FROM status WHERE Id_Status = _Id_Status;
END