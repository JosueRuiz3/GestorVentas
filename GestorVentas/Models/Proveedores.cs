using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Proveedores
    {
        public int IdProveedor { get; set; }

        public string Compañia { get; set; }

        public string NombreRepresentante { get; set; }

        public string Telefono { get; set; }


        [JsonIgnore]
        public List<Producto> oProductos { get; set; }//Propiedad de Navegación
    }
}
