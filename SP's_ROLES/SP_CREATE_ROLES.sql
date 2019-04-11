CREATE PROCEDURE `SP_CREATE_ROLES`(
 _Rol_Name VARCHAR(100), 
 _Jsn JSON, 
 _Id_Grade INT
 )
BEGIN
INSERT INTO roles (Rol_Name,Jsn,Id_Grade) 
VALUE(_Rol_Name,_Jsn,_Id_Grade);
END