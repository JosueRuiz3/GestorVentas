using System.Data;
using System.Data.SqlClient;

namespace GestorVentas.Data
{
    public class Dto_Facturacion
    {
        public string Registrar(string venta_xml)
        {
            string respuesta = "";
            var cn = new Connection();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Venta", oconexion);
                    cmd.Parameters.Add("Venta_xml", SqlDbType.Xml).Value = venta_xml;
                    cmd.Parameters.Add("NroDocumento", SqlDbType.VarChar, 6).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();
                    respuesta = cmd.Parameters["NroDocumento"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                respuesta = "";
            }

            return respuesta;
        }

    }
}
