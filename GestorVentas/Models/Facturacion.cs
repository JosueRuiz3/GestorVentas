using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Facturacion
    {
        public int Id { get; set; }

        public DateTime FechaFacturacion { get; set; }

        public double Descuento { get; set; }

        public double Impuesto { get; set; }


        public int FacturacionConClienteId { get; set; }
        [JsonIgnore]
        public Clientes FacturacionConCliente { get; set; }


        //[Display(Name = "Productos")]
        //[JsonIgnore]
        //public int FacturacionProductosId { get; set; }
        //[JsonIgnore]
        //public Productos FacturacionProductos { get; set; }

        [JsonIgnore]
        public List<DetalleFactura> DetalleFactura { get; set; }
    }
}
