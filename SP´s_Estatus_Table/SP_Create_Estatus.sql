/*pasan los parametros para poder llevar a cabo la insercion 
que solicita la consulta de insersion */
CREATE PROCEDURE `SP_Create_Estatus`(Estatus varchar(100))
BEGIN

/*se genera la consulta */
Insert into estatus (Estatus) value (@Estatus);
END