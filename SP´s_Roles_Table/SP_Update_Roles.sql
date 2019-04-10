/*Modificacion de Roles*/
CREATE PROCEDURE `SP_Update_Roles`(Id_Rol int,Rol_Name varchar(100), Jsn json, Jerarquia int)
BEGIN
update roles set Rol_Name = @Rol_Name, Jsn = @Jsn, Jerarquia = @Jerarquia Where Id_Rol = @Id_Rol;
END