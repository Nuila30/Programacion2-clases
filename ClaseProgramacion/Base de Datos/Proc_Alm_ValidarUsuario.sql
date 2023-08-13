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