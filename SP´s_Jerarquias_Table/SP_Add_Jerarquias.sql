/*Insert dentro de la tabla Jerarquia*/
CREATE  PROCEDURE `SP_Add_Jerarquias`(Nombre varchar(100), Peso int)
BEGIN
Insert Into Jerarquias (Nombre, Peso) value (@Nombre , @peso);
END