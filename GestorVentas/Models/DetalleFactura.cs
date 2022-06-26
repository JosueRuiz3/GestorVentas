using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class DetalleFactura
    {
        public int IdDatelleVenta { get; set; }

        public Producto oProductoId { get; set; }

        public decimal PrecioVenta { get; set; }

        public decimal Cantidad { get; set; }

        public decimal TOTAL { get; set; }

      
    }
}
