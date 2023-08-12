using System;
using System.Configuration;// Para el Acceso al Web.config
using System.Data;
using System.Data.SqlClient;// clases base para sql-server
// NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
public class Service : IService
{
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string Conexion = ConfigurationManager.ConnectionStrings["ConexionSql"].ConnectionString;
    string Patron = ConfigurationManager.AppSettings["Patron"].ToString();

    public DataSet ValidarUsuario(string Login, string Password)
    {
        try
        {
            da = new SqlDataAdapter("SP_ValidarUsuario", Conexion);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@login", Login);
            da.SelectCommand.Parameters.AddWithValue("@Password", Password);
            da.SelectCommand.Parameters.AddWithValue("@Patron ", Patron);
            da.Fill(ds, "PerfilUsuario");

        }
        catch (Exception ex)
        {
            ds = null;
        }
        return ds;
    }


}
