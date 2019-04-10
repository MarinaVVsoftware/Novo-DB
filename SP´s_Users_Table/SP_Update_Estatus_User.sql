CREATE PROCEDURE `SP_Update_Estatus_User`(Id_User int, Estatus int)
BEGIN
Update Usuarios set Estatus = @Estatus Where Id_User = @Id_User;
END