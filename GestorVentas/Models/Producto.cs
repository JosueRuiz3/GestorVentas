using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Producto
    {
        public int IdProducto { get; set; }

        public string Codigo { get; set; }

        public Categorias oCategoria { get; set; }

        public string NombreProducto { get; set; }

        public decimal PrecioCompra { get; set; }

        public decimal PrecioVenta { get; set; }

        public int UnidadesEnExistencia { get; set; }

        public Proveedores oProveedores { get; set; }
    }
}
