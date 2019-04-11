CREATE PROCEDURE `SP_CREATE_GRADES`(
_Name VARCHAR(100),
_type_Grade INT
)
BEGIN
INSERT INTO grade( Name, type_Grade) 
VALUE(_Name,_type_Grade);
END