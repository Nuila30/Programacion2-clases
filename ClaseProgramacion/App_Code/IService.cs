using System.Data;
using System.ServiceModel;

// NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
[ServiceContract]
public interface IService
{

    [OperationContract]
    DataSet ValidarUsuario(string Login, string Password);

    // TODO: agregue aquí sus operaciones de servicio
}

