CREATE PROCEDURE `SP_UPDATE_ROLES`
(
_Id_Rol INT, 
_Rol_Name VARCHAR (100),
_Jsn JSON,
_Id_Grade INT
)
BEGIN
UPDATE roles 
set 
Rol_Name = _Rol_Name,
Jsn = _Jsn,
Id_Grade = _Id_Grade 
WHERE Id_Rol = _Id_Rol;
END
