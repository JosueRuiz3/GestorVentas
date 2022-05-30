using GestorVentas.Models;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace GestorVentas.Data
{
    public class Dto_Producto
    {
        public List<Productos> Listar()
        {

            var oLista = new List<Productos>();

            var cn = new Connection();

            using (var connection = new SqlConnection(cn.getCadenaSQL()))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SP_Listar_Producto", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oLista.Add(new Productos()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            NombreProducto = dr["NombreProducto"].ToString(),
                            PrecioUnidad = Convert.ToDecimal(dr["PrecioUnidad"], new CultureInfo("es-PE")),
                            PrecioVenta = Convert.ToDecimal(dr["PrecioVenta"], new CultureInfo("es-PE")),
                            UnidadesEnExistencia = Convert.ToInt32(dr["UnidadesEnExistencia"]),
                            CodigoProducto = dr["CodigoProducto"].ToString(),
                            oCategoria = new Categorias() { IdCategoria = Convert.ToInt32(dr["IdCategoria"]), Descripcion = dr["Descripcion"].ToString() },

                        });
                    }
                }
            }

            return oLista;
        }


        public bool Guardar(Productos obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {

                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Guardar_Producto", oconexion);
                    cmd.Parameters.AddWithValue("NombreProducto", obj.NombreProducto);
                    cmd.Parameters.AddWithValue("PrecioUnidad", obj.PrecioUnidad);
                    cmd.Parameters.AddWithValue("PrecioVenta", obj.PrecioVenta);
                    cmd.Parameters.AddWithValue("UnidadesEnExistencia", obj.UnidadesEnExistencia);
                    cmd.Parameters.AddWithValue("CodigoProducto", obj.CodigoProducto);
                    cmd.Parameters.AddWithValue("IdCategoria", obj.oCategoria.IdCategoria);
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

        public bool Editar(Productos obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Actualizar_Producto", oconexion);
                    cmd.Parameters.AddWithValue("Id", obj.Id);
                    cmd.Parameters.AddWithValue("NombreProducto", obj.NombreProducto);
                    cmd.Parameters.AddWithValue("PrecioUnidad", obj.PrecioUnidad);
                    cmd.Parameters.AddWithValue("PrecioVenta", obj.PrecioVenta);
                    cmd.Parameters.AddWithValue("UnidadesEnExistencia", obj.UnidadesEnExistencia);
                    cmd.Parameters.AddWithValue("CodigoProducto", obj.CodigoProducto);
                    cmd.Parameters.AddWithValue("IdCategoria", obj.oCategoria.IdCategoria);
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
                    SqlCommand cmd = new SqlCommand("SP_Eliminar_Producto", oconexion);
                    cmd.Parameters.AddWithValue("Id", id);
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

