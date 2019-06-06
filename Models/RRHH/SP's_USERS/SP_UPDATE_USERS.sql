/*/*STORE PROCEDURE ACTUALIZA LA INFORMACION GENERAL DEL USUARIO*//
CREATE PROCEDURE `SP_UPDATE_USERS`
/*DECLARACIÓN DE VARIABLES*/
(
v_id_user INT,
v_user_name VARCHAR(200),
v_email VARCHAR(150),
v_rol INT,
v_status INT
)
BEGIN
/*CONSULTA A LA BD*/
UPDATE users SET 
user_name = v_user_name,email = v_email, rol = v_rol, status = v_status
WHERE id_user= v_id_user;
END