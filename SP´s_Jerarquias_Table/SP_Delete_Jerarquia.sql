CREATE PROCEDURE `SP_Delete_Jerarquia`(Id_Jerarquia int)
BEGIN
Delete from Jerarquia where Id_Jerarquia = @Id_Jerarquia;
END