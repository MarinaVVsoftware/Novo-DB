
 
 CREATE TABLE IF NOT EXISTS Usuarios
(
	Id_User int AUTO_INCREMENT PRIMARY KEY,
	User_Name varchar(300),
	Email varchar(150),
	rol Int not null,
	Estatus int not null,
	Eliminado int

);
CREATE TABLE IF NOT EXISTS Jerarquias
(
Id_Jerarquia int auto_increment primary key,
Nombre varchar(100),
peso INT NOT NULL

);
CREATE TABLE IF NOT EXISTS Roles
(
	Id_Rol INT AUTO_INCREMENT PRIMARY KEY,
	Rol_Name varchar(100),
    Jsn text,
	Jerarquia Int
  
) ;

Alter table Roles add   constraint foreign key (jerarquia) references Jerarquias(Id_Jerarquia);
Create Table Estatus 
(
Id_Estatus Int Auto_Increment Primary key,
Estatus varchar(100)
);