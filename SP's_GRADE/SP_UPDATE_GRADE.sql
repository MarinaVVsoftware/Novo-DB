CREATE PROCEDURE `SP_UPDATE_GRADE` 
(
_Id_Grade INT,
_Name VARCHAR(100),
_type_Grade INT
)
BEGIN
UPDATE grade SET  
Name = _Name, 
type_Grade = _type_Grade 
WHERE Id_Grade = _Id_Grade;
END
