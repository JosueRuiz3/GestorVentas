using GestorVentas.Models;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Serialization;

namespace GestorVentas.Data
{
    public class Dto_Facturacion
    {
        public string RegistrarVenta(Facturacion venta)
        {
            string respuesta = "";
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_RealizarCompras", oconexion);
                    cmd.Parameters.Add("@Venta_xml", SqlDbType.Xml).Value = ConvertToXmlString(venta);
                    cmd.Parameters.Add("@NroDocumento", SqlDbType.VarChar, 6).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();
                    respuesta = cmd.Parameters["@NroDocumento"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                respuesta = "";
            }

            return respuesta;
        }

        public int InsertarFacturacion(Facturacion venta)
        {
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Facturacion (NumDocumento, DocCliente, MontoPagoCon, MontoCambio, MontoSubTotal, MontoIVA, MontoTotal, FechaCreacion) " +
                                                    "VALUES (@NumDocumento, @DocCliente, @MontoPagoCon, @MontoCambio, @MontoSubTotal, @MontoIVA, @MontoTotal, GETDATE()); " +
                                                    "SELECT SCOPE_IDENTITY();", oconexion);

                    cmd.Parameters.AddWithValue("@NumDocumento", venta.NumDocumento);
                    cmd.Parameters.AddWithValue("@DocCliente", venta.DocCliente);
                    cmd.Parameters.AddWithValue("@MontoPagoCon", venta.MontoPagoCon);
                    cmd.Parameters.AddWithValue("@MontoCambio", venta.MontoCambio);
                    cmd.Parameters.AddWithValue("@MontoSubTotal", venta.MontoSubTotal);
                    cmd.Parameters.AddWithValue("@MontoIVA", venta.MontoIVA);
                    cmd.Parameters.AddWithValue("@MontoTotal", venta.MontoTotal);

                    int idFacturacion = Convert.ToInt32(cmd.ExecuteScalar());
                    return idFacturacion;
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones y registro de errores si es necesario.
                // ...
                return -1; // Devuelve un valor negativo o lanza una excepción para indicar que ocurrió un error.
            }
        }

        public bool InsertarDetalleVenta(DetalleVenta detalleVenta)
        {
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO DetalleVenta (FacturacionId, ProductoId, ClienteId, PrecioVenta, Cantidad, TOTAL, FechaCreacion) " +
                                                    "VALUES (@FacturacionId, @ProductoId, @ClienteId, @PrecioVenta, @Cantidad, @TOTAL, GETDATE());", oconexion);

                    cmd.Parameters.AddWithValue("@FacturacionId", detalleVenta.FacturacionId);
                    cmd.Parameters.AddWithValue("@ProductoId", detalleVenta.oProductoId);
                    cmd.Parameters.AddWithValue("@ClienteId", detalleVenta.ClienteId);
                    cmd.Parameters.AddWithValue("@PrecioVenta", detalleVenta.PrecioVenta);
                    cmd.Parameters.AddWithValue("@Cantidad", detalleVenta.Cantidad);
                    cmd.Parameters.AddWithValue("@TOTAL", detalleVenta.TOTAL);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions and log errors if necessary.
                // ...
                return false; // Return false or throw an exception to indicate an error.
            }
        }


        public bool ActualizarNumeroDocumento(int idFacturacion, string numDocumento)
        {
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Facturacion SET NumDocumento = @NumDocumento WHERE IdFacturacion = @IdFacturacion;", oconexion);
                    cmd.Parameters.AddWithValue("@NumDocumento", numDocumento);
                    cmd.Parameters.AddWithValue("@IdFacturacion", idFacturacion);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones y registro de errores si es necesario.
                // ...
                return false; // Devuelve false o lanza una excepción para indicar que ocurrió un error.
            }
        }

        private string ConvertToXmlString(Facturacion venta)
        {
            if (venta == null)
            {
                return ""; // Handle null case if necessary
            }

            try
            {
                XmlSerializer serializer = new XmlSerializer(typeof(Facturacion));

                using (StringWriter writer = new StringWriter())
                {
                    serializer.Serialize(writer, venta);
                    return writer.ToString();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions if necessary
                // Log or throw an exception based on your requirements.
                return "";
            }
        }

        public bool ActualizarUnidadesEnExistencia(int idProducto, int cantidad)
        {
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Productos SET UnidadesEnExistencia = UnidadesEnExistencia - @Cantidad WHERE IdProducto = @IdProducto;", oconexion);
                    cmd.Parameters.AddWithValue("@Cantidad", cantidad);
                    cmd.Parameters.AddWithValue("@IdProducto", idProducto);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones y registro de errores si es necesario.
                // ...
                return false; // Devuelve false o lanza una excepción para indicar que ocurrió un error.
            }
        }
    }
}
