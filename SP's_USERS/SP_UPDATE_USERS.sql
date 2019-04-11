CREATE PROCEDURE `SP_UPDATE_USERS`(
V_Id_User INT,
V_User_Name VARCHAR(200),
V_Email VARCHAR(150),
V_rol INT,
V_Status INT
)
BEGIN
UPDATE USERS 
SET 
User_Name = V_User_Name,
Email = V_Email, 
rol = V_rol, 
Status = V_Status 

WHERE 
Id_User= V_Id_User;
END