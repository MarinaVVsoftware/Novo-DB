/*Modificacion de informacion dentro de la tabla jerarquia*/
CREATE PROCEDURE `SP_Update_Jerarquia`(Id_Jerarquia int, Nombre varchar(100), peso int)
BEGIN
Update Jerarqias set Nombre = @Nombre, peso = @peso where Id_Jerarquia = @Id_Jerarquia;
END