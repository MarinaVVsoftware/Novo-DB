CREATE  PROCEDURE `SP_Read_User`()
BEGIN
Select * from Usuario where Estatus = 1 ;
END