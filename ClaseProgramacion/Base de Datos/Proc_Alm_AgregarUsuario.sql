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
