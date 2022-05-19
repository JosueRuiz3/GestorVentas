using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Facturacion
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [DataType(DataType.Date)]
        [Display(Name = "FechaDacturacion")]
        public DateTime FechaFacturacion { get; set; }

        [Display(Name = "Descuento")]
        public double Descuento { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Impuesto")]
        public double Impuesto { get; set; }


        [Display(Name = "Cliente")]
        [JsonIgnore]
        public int FacturacionConClienteId { get; set; }
        [JsonIgnore]
        public Clientes FacturacionConCliente { get; set; }


        [Display(Name = "Productos")]
        [JsonIgnore]
        public int FacturacionProductosId { get; set; }
        [JsonIgnore]
        public Productos FacturacionProductos { get; set; }


        [JsonIgnore]
        public List<DetalleFactura> DetalleFactura { get; set; }
    }
}
