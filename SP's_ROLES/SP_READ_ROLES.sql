/*STORE PROCEDURE PARA ENLISTAR LA INFORMACIÓN DENTRO DE LA TABLA ROLES*/
CREATE PROCEDURE `SP_READ_ROLES`()
BEGIN
/*CONSULTA A LA BD*/
SELECT * FROM roles;
END