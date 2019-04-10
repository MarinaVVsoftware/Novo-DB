CREATE PROCEDURE `SP_Delete_Roles`(Id_Rol int)
BEGIN
Delete from roles where Id_Rol = @Id_Rol;
END