CREATE PROCEDURE `SP_CREATE_STATUS`(
_Id_Status INT,
_Status VARCHAR(100)
)
BEGIN
INSERT INTO status(Id_Status, Status)VALUE(_Id_Status,_Status);
END