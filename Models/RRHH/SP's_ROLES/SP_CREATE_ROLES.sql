/*/*STORE PROCEDURE PARA LA CREACION DE ROLES*/
CREATE PROCEDURE `SP_CREATE_ROLES`
/*DECLARACIÓN DE VARIABLES*/
(
 _rol_name VARCHAR(100), 
 _jsn JSON, 
 _id_grade INT
 )
BEGIN
/*CONSULTA A LA BD*/
INSERT INTO roles (rol_name,jsn,id_grade) 
VALUES(_rol_name,_jsn,_id_grade);
END