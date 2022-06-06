using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class DetalleFactura
    {
        public int Id { get; set; }

        public string Precio { get; set; }

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
