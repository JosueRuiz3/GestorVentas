using GestorVentas.Models;
using System.Data;
using System.Data.SqlClient;

namespace GestorVentas.Data
{
    public class Dto_Login
    {
        public List<Login> Listar()
        {
            var oLista = new List<Login>();

            var cn = new Connection();

            using (var connection = new SqlConnection(cn.getCadenaSQL()))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SP_Listar_Login", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oLista.Add(new Login()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Usuario = dr["Usuario"].ToString(),
                            Contrasena = dr["Contrasena"].ToString()

                        }); ;
                    }
                }
            }

            return oLista;
        }

        public bool Guardar(Login obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {

                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Guardar_Login", oconexion);
                    cmd.Parameters.AddWithValue("Usuario", obj.Usuario);
                    cmd.Parameters.AddWithValue("Contrasena", obj.Contrasena);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();
                    respuesta = true;
                }
            }
            catch (Exception ex)
            {
                respuesta = false;
            }
            return respuesta;
        }

    }
}
