--Eliminacion de la base si ya existe 
drop database if exists bd_inventario;

--creacion de la base de datos 
create database bd_inventario;

--Uso de La base anteriomente creada 
use bd_inventario;

--Creacion de la tabla Usuario
create table usuario(

IdUsuario int primary key identity(1,1),
Nombre varchar(50),
Login varchar(25),
Password VARBINARY (500),
Email varchar(50),
Estado BIT,
IdPrivilegio INT,
Fecha DATETIME DEFAULT GETDATE()

);

 
--Creacion de la tabla Privilegio
create table Privilegio(

idPrivilegio int primary key,

rol varchar(50)

);


--Creacion de los insert para la tabla usuario
insert into usuario (Nombre,Login,Email,Estado,IdPrivilegio)
values('Brandon','Nuila','Nuila@gmail.com','true','1');

--Creacion de los insert para la tabla Privilegio
insert into Privilegio(idPrivilegio,rol)values
('1','Operador'),
('2','Supervisor'),
('3','Jefe'),
('4','Gerente'),
('5','Directivo'),
('6','Presidente'),
('7','Administrador');

--Asignando password encriptado, usando patròn de encrptacion
Update usuario Set Password=ENCRYPTBYPASSPHRASE('Pr09r@2','123');

--Desencriptar un campo
Select Login,Convert(varchar(25),DECRYPTBYPASSPHRASE('Pr09r@2',Password)) Password From usuario;
