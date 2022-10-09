using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using GestorVentas.Models;

namespace GestorVentas.Data
{
    public class Dto_Productos
    {
        public List<Producto> Listar()
        {

            var oLista = new List<Producto>();

            var cn = new Connection();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("SP_Listar_Productos", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oLista.Add(new Producto()
                        {
                            IdProducto = Convert.ToInt32(dr["IdProducto"]),
                            Codigo = dr["Codigo"].ToString(),
                            oCategoria = new Categorias() { IdCategoria = Convert.ToInt32(dr["IdCategoria"]), Descripcion = dr["DesCategoria"].ToString() },
                            NombreProducto = dr["NombreProducto"].ToString(),
                            PrecioCompra = Convert.ToDecimal(dr["PrecioCompra"], new CultureInfo("es-PE")),
                            PrecioVenta = Convert.ToDecimal(dr["PrecioVenta"], new CultureInfo("es-PE")),
                            UnidadesEnExistencia = Convert.ToInt32(dr["UnidadesEnExistencia"]),
                            oProveedores = new Proveedores() { IdProveedor = Convert.ToInt32(dr["IdProveedor"]), Compania = dr["ComProveedor"].ToString() }
                        });

                    }
                }
            }

            return oLista;
        }

        public bool Guardar(Producto obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {

                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Guardar_Producto", oconexion);
                    cmd.Parameters.AddWithValue("Codigo", obj.Codigo);
                    cmd.Parameters.AddWithValue("IdCategoria", obj.oCategoria.IdCategoria);
                    cmd.Parameters.AddWithValue("NombreProducto", obj.NombreProducto);
                    cmd.Parameters.AddWithValue("PrecioCompra", obj.PrecioCompra);
                    cmd.Parameters.AddWithValue("PrecioVenta", obj.PrecioVenta);
                    cmd.Parameters.AddWithValue("UnidadesEnExistencia", obj.UnidadesEnExistencia);
                    cmd.Parameters.AddWithValue("IdProveedor", obj.oProveedores.IdProveedor);
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


        public bool Editar(Producto obj)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {

                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Editar_Producto", oconexion);
                    cmd.Parameters.AddWithValue("IdProducto", obj.IdProducto);
                    cmd.Parameters.AddWithValue("Codigo", obj.Codigo);
                    cmd.Parameters.AddWithValue("IdCategoria", obj.oCategoria.IdCategoria);
                    cmd.Parameters.AddWithValue("NombreProducto", obj.NombreProducto);
                    cmd.Parameters.AddWithValue("PrecioCompra", obj.PrecioCompra);
                    cmd.Parameters.AddWithValue("PrecioVenta", obj.PrecioVenta);
                    cmd.Parameters.AddWithValue("UnidadesEnExistencia", obj.UnidadesEnExistencia);
                    cmd.Parameters.AddWithValue("IdProveedor", obj.oProveedores.IdProveedor);
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

        public bool Eliminar(int idProducto)
        {
            bool respuesta;
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Eliminar_Producto", oconexion);
                    cmd.Parameters.AddWithValue("IdProducto", idProducto);
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
