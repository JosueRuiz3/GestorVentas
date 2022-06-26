using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Facturacion
    {
        public int IdFacturacion { get; set; }

        public string NumDocumento  { get; set; }

        public string DocCliente { get; set; }

        public decimal MontoPagoCon { get; set; }

        public decimal MontoCambio { get; set; }

        public decimal MontoSubTotal { get; set; }

        public decimal MontoIVA { get; set; }

        public decimal MontoTotal { get; set; }

        public string FechaRegistro { get; set; }



        [JsonIgnore]
        public List<DetalleFactura> oDetalleFactura { get; set; }


        
    }
}
