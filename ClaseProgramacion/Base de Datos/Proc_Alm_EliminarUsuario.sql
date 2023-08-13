Create Procedure SP_EliminarUsuario
@IdUsuario int
As
Begin
    Delete From Usuarios Where IdUsuario=@IdUsuario
    Select 'OK-Registro eliminado con éxito!' Mensaje
End