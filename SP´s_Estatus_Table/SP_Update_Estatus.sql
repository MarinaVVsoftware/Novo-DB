/*Este procedure es para la actualizacion de dato
en la tabla de Estatus*/
CREATE PROCEDURE `SP_Update_Estatus`(Id_Estatus Int, Estatus varchar(100))
BEGIN
update estatus set Estatus = @Estatus where Id_Estatus = @Id_Estatus;
END