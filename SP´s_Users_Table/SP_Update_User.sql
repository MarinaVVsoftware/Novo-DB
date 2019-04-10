CREATE PROCEDURE `Update_Usuario`(
Id_User Int,
user_Name varchar(300),
Email varchar(100),
rol INT,
Estatus Int,
Eliminado Int
)
BEGIN
Update Usuarios set User_Name = @user_name,Email= @Email,rol = @rol,Estatus = @Estatus , Eliminado = @Eliminado where Id_User = @Id_User;
END