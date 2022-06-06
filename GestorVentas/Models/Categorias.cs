using System.ComponentModel.DataAnnotations;

namespace GestorVentas.Models
{
    public class Categorias
    {
        public int IdCategoria { get; set; }

        public string NombreCategoria { get; set; }

        public string Descripcion { get; set; }

        public List<Producto> oProductos { get; set; }//Propiedad de Navegación
    }
}
