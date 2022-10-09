using GestorVentas.Models;
using System.Data;
using System.Data.SqlClient;

namespace GestorVentas.Data
{
    public class Dto_Proveedores
    {
        public List<Proveedores> Listar()
        {

            var oLista = new List<Proveedores>();

            var cn = new Connection();

            using (var connection = new SqlConnection(cn.getCadenaSQL()))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SP_Listar_Proveedores", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oLista.Add(new Proveedores()
                        {
                            IdProveedor = Convert.ToInt32(dr["IdProveedor"]),
                            Compania = dr["Compania"].ToString(),
                            NombreRepresentante = dr["NombreRepresentante"].ToString(),
                            Telefono = dr["Telefono"].ToString()
                        });
                    }
                }
            }

            return oLista;
        }

        public bool Guardar(Proveedores obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {

                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Guardar_Proveedores", oconexion);
                    cmd.Parameters.AddWithValue("Compania", obj.Compania);
                    cmd.Parameters.AddWithValue("NombreRepresentante", obj.NombreRepresentante);
                    cmd.Parameters.AddWithValue("Telefono", obj.Telefono);
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

        public bool Editar(Proveedores obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Actualizar_Proveedores", oconexion);
                    cmd.Parameters.AddWithValue("IdProveedor", obj.IdProveedor);
                    cmd.Parameters.AddWithValue("Compania", obj.Compania);
                    cmd.Parameters.AddWithValue("NombreRepresentante", obj.NombreRepresentante);
                    cmd.Parameters.AddWithValue("Telefono", obj.Telefono);
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

        public bool Eliminar(int id)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Eliminar_Proveedores", oconexion);
                    cmd.Parameters.AddWithValue("IdProveedor", id);
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
