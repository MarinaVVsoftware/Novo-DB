/*/*STORE PROCEDURE PARA LA ELIMINACIÓN DE UNA USUARIOS*/
CREATE PROCEDURE `SP_DELETE_USERS`
/*DECLARACIÓN DE VARIABLES*/
(
v_Id_User INT
)
BEGIN
/*CONSULTA A LA BD*/
DELETE FROM USERS WHERE Id_User = v_Id_User;
END