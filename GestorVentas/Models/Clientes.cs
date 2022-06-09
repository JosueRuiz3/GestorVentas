using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Clientes
    {
        public int IdCliente { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string Direccion { get; set; }

        public string Telefono { get; set; }

        public string Fax { get; set; }


        [JsonIgnore]
        public List<Facturacion> Facturacion { get; set; } //Propiedad de Navegación
    }
}
