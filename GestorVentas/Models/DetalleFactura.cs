using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class DetalleFactura
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Precio Del Producto")]
        [StringLength(15, ErrorMessage = "El {0} debe ser al menos {2} y máximo {1} caracteres", MinimumLength = 3)]
        public string Precio { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Cantidad")]
        public int Cantidad { get; set; }


        //[Display(Name = "Productos")]
        //[JsonIgnore]
        //public int DetalleFacConProductoId { get; set; }
        //[JsonIgnore]
        //public Productos DetalleFacConProducto { get; set; }

        [Display(Name = "Facturacion")]
        [JsonIgnore]
        public int FacturacionConDetalleFacturaId { get; set; }//Relacion con DetalleFactura FK
        [JsonIgnore]
        public Facturacion FacturacionConDetalleFactura { get; set; }//Atributos de Navegacion
    }
}
