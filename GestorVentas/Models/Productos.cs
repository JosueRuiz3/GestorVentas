using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Productos
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Producto")]
        public string NombreProducto { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Precio Unidad ")]
        public decimal PrecioUnidad { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Precio Venta ")]
        public decimal PrecioVenta { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "En Existencia")]
        public int UnidadesEnExistencia { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Codigo Producto")]
        public string CodigoProducto { get; set; }



        [Display(Name = "Categoria")]
        [JsonIgnore]
        public int CategoriaConProductoId { get; set; }//Relacion con Categorias FK
        [Display(Name = "Categoria")]
        [JsonIgnore]
        public Categorias CategoriaConProducto { get; set; }//Atributos de Navegacion

        [Display(Name = "Proveedor")]
        [JsonIgnore]
        public int ProveedoresConProductosId { get; set; }//Relacion con Proveedores FK
        [Display(Name = "Proveedor")]
        [JsonIgnore]
        public Proveedores ProveedoresConProductos { get; set; }//Atributos de Navegacion



        [JsonIgnore]
        public List<Facturacion> Facturacion { get; set; } //Propiedad de Navegación

        [JsonIgnore]
        public List<DetalleFactura> DetalleFacturas { get; set; }//Propiedad de Navegación
    }
}
