CREATE PROCEDURE `SP_CREATE_USER`(
User_Name VARCHAR(200),
Email VARCHAR(150),
rol INT, 
Status INT
)
BEGIN
INSERT INTO USERS 
(
User_Name,
Email,
rol,
Status
)
VALUE
(
User_Name,
Email,
rol,
Status
);
END