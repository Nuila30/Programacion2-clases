
drop database if exists bd_inventario;

create database bd_inventario;

use bd_inventario;

 

 

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

 

 

create table Privilegio(

idPrivilegio int primary key,

rol varchar(50)

);

 

 

insert into usuario (Nombre,Login,Email,Estado,IdPrivilegio)

values('Brandon','Nuila','Nuila@gmail.com','true','1');

 

 

insert into Privilegio(idPrivilegio,rol)values

('1','Operador'),

('2','Supervisor'),

('3','Jefe'),

('4','Gerente'),

('5','Directivo'),

('6','Presidente'),

('7','Administrador');

 

 

 

select * from Privilegio;

select * from usuario;

 

 

--Asignando password encriptado, usando patròn de encrptacion

Update usuario Set Password=ENCRYPTBYPASSPHRASE('Pr09r@2','123');

 

 

--Desencriptar un campo

Select Login,Convert(varchar(25),DECRYPTBYPASSPHRASE('Pr09r@2',Password)) Password From usuario;

--procedimiento Alamacenado

 

 

use bd_inventario;

 

 

--Exec prodecimiento 

Create Procedure SP_AgregarUsuario

@Nombre varchar(50),

@Login varchar(25),

@Password varchar(25),

@Email varchar(25),

@Estado bit,

@IdPrivilegio int,

@Patron varchar(25) 

As

Begin

    Insert Into  usuario

    (Nombre,Login,Password,Email,Estado,idPrivilegio)

    Values

    (@Nombre,@Login,EncryptByPassPhrase(@Patron,@Password),@Email,@Estado,@IdPrivilegio)

    Select @@IDENTITY IdUsuario

End

 

 

Create Procedure SP_ModificarUsuario

@IdUsuario int,

@Nombre varchar(50),

@Login varchar(25),

@Password varchar(25),

@Email varchar(25),

@Estado bit,

@IdPrivilegio int,

@Patron varchar(25) 

As

Begin

    Update usuario Set 

    Nombre=@Nombre,Login=@Login,Password=EncryptByPassPhrase(@Patron,@Password),

    Email=@Email,Estado=@Estado,IdPrivilegio=@IdPrivilegio

    Where IdUsuario=@IdUsuario

    Select 'OK-Registro modificado con éxito!' Mensaje

End

--Exec SP_ModificarUsuario 2,'Pedro Antonio Flores Perez','PF','123','pf@gmail.com',1,1,'Pr09r@2'

 


Create Procedure SP_EliminarUsuario

@IdUsuario int

As

Begin

    Delete From usuario Where IdUsuario=@IdUsuario

    Select 'OK-Registro eliminado con éxito!' Mensaje

End

--Exec SP_EliminarUsuario 3

 

Create Procedure SP_ValidarUsuario

@Login varchar(25),

@Password varchar(25),

@Patron varchar(25)

As

Begin

    Select * From usuario Where Login=@Login And

    Convert(varchar(25),DecryptByPassPhrase(@Patron,Password))=@Password

End

--Exec SP_ValidarUsuario 'PF','123','Pr09r@2'

 

Create Procedure SP_BuscarUsuario

@IdUsuario int,

@Nombre varchar(25),

@Login varchar(25),

@Email varchar(50),

@IdPrivilegio int,

@Estado char(1)

As

Begin

    If (@IdUsuario > 0)

        Select * From Usuario Where IdUsuario=@IdUsuario

    Else If (Len(@Nombre) > 0)

        Select * From usuario Where Nombre Like '%' + @Nombre + '%'

    Else If (Len(@Login) > 0)

        Select * From usuario Where Login = @Login

    Else If (Len(@Email) > 0)

        Select * From usuario Where Email = @Email

    Else If (@IdPrivilegio > 0)

        Select * From usuario Where IdPrivilegio=@IdPrivilegio

    Else

    Begin

        If (@Estado='A')

            Select * From usuario Where Estado=1

        Else If (@Estado='I')

            Select * From usuario Where Estado=0

        Else

            Select * From usuario

    End

End

--Exec SP_BuscarUsuario 0,'','PF','',0,0

 

Create Procedure SP_Privilegios

As

Begin

    Select * From Privilegio

End