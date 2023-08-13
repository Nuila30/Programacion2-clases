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