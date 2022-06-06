using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Clientes
    {
        public int Id { get; set; }

        public string NombreCliente { get; set; }

        public string Direccion { get; set; }

        public string Telefono { get; set; }

        public string Fax { get; set; }


        [JsonIgnore]
        public List<Facturacion> Facturacion { get; set; } //Propiedad de Navegación
    }
}
