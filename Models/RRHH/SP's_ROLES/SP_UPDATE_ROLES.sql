/*/*STORE PROCEDURE PARA LA MODIFICACIÓN DE DATOS DENTRO DE LA TABLA ROLES*/
CREATE PROCEDURE `SP_UPDATE_ROLES`
/*DECLARACIÓN DE VARIABLES*/
(
_id_rol INT, 
_rol_name VARCHAR (100),
_jsn JSON,
_id_grade INT
)
BEGIN
/*CONSULTA A LA BD*/
UPDATE roles set rol_name = _rol_name,jsn = _jsn,id_grade = _id_grade WHERE id_rol = _id_rol;

END
