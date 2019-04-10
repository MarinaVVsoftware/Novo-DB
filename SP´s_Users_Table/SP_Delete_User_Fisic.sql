/*Remover Usuarios*/
REATE PROCEDURE `SP_Delete_User_fisic` (Id_User int)
BEGIN
Delete from Usuarios where Id_User = @Id_User;
END
