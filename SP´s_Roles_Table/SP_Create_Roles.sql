/*Creacion de Roles*/

CREATE  PROCEDURE `SP_Create_Roles`(Rol_Name varchar(100), Jsn json, Jerarquia int)
BEGIN
Insert Into roles (Rol_Name, Jsn, Jerarquia) value (@Rol_Name , @Jsn, @Jerarquia);
END