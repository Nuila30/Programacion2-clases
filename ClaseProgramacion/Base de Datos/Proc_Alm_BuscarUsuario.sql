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