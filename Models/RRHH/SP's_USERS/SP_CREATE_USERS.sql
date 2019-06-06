
/*/*STORE PROCEDURE PARA LA CREACIÓN DE UNA USUARIOS*/
CREATE PROCEDURE `SP_CREATE_USER`
/* DECALRACIÓN DE VARIABLES*/
(
_user_name VARCHAR(200),
_email VARCHAR(150),
_rol INT, 
_status INT
)
BEGIN
/*CONSULTA A LA BD*/
INSERT INTO users 
(user_name,email,rol,status)
VALUE(_user_name,_email,_rol,_status);
END