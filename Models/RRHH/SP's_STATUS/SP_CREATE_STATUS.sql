/*/*STORE PROCEDURE PARA LA CREACIÓN DE UNA ESTATUS*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_STATUS`
/*VARIBALES*/
(
_id_status INT,
_status VARCHAR(100)
)
BEGIN
/*CONSULTA A LA BD*/
INSERT INTO status(id_status, status)VALUE(_id_status,_status);
END