/*hace un select en la tabla de estatus para hacer el read
dentro del sistema*/
CREATE PROCEDURE `SP_Read_Estatus`()
BEGIN
Select * From Estatus;
END