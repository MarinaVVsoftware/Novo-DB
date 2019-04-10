CREATE  PROCEDURE `insersertar_Usuario`(user_Name varchar(300),
Email varchar(100),
rol INT,
Estatus Int,
Eliminado Int)
BEGIN

Insert Into Usuarios (Id_User,User_Name,Email,rol,Estatus,Eliminado) VALUES (@User_Name,@Email,@rol,@Estatus,@Eliminado);

END