CREATE PROCEDURE `SP_Create_Estatus`(Estatus varchar(100))
BEGIN
Insert into estatus (Estatus) value (@Estatus);
END