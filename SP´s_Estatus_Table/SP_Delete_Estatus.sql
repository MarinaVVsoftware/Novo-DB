CREATE PROCEDURE `SP_Delete_Estatus` (Id_Estatus int)
BEGIN
Delete from estatus where Id_Estatus = @Id_Estatus;
END
