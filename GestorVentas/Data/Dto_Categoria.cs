using GestorVentas.Models;
using System.Data;
using System.Data.SqlClient;

namespace GestorVentas.Data
{
    public class Dto_Categoria
    {
        public List<Categorias> Listar()
        {

            var oLista = new List<Categorias>();

            var cn = new Connection();

            using (var connection = new SqlConnection(cn.getCadenaSQL()))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SP_Listar_Categoria", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oLista.Add(new Categorias()
                        {
                            IdCategoria = Convert.ToInt32(dr["IdCategoria"]),
                            NombreCategoria = dr["NombreCategoria"].ToString(),
                            Descripcion = dr["Descripcion"].ToString()
                        });
                    }
                }
            }

            return oLista;
        }

        public bool Guardar(Categorias obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {

                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Guardar_Categoria", oconexion);
                    cmd.Parameters.AddWithValue("NombreCategoria", obj.NombreCategoria);
                    cmd.Parameters.AddWithValue("Descripcion", obj.Descripcion);
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

        public bool Editar(Categorias obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Actualizar_Categoria", oconexion);
                    cmd.Parameters.AddWithValue("IdCategoria", obj.IdCategoria);
                    cmd.Parameters.AddWithValue("NombreCategoria", obj.NombreCategoria);
                    cmd.Parameters.AddWithValue("Descripcion", obj.Descripcion);
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

        public bool Eliminar(int idCategoria)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Eliminar_Categoria", oconexion);
                    cmd.Parameters.AddWithValue("IdCategoria", idCategoria);
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
