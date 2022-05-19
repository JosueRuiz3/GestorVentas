using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Clientes
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Nombre Del Cliente")]
        [StringLength(15, ErrorMessage = "No más de 15 caracteres")]
        public string NombreCliente { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Dirección")]
        [StringLength(100, ErrorMessage = "No más de 100 caracteres")]
        public string Direccion { get; set; }

        [Display(Name = "Teléfono")]
        [StringLength(20, ErrorMessage = "No más de 20 caracteres")]
        public string Telefono { get; set; }

        [Display(Name = "Fax")]
        [StringLength(50, ErrorMessage = "No más de 50 caracteres")]
        public string Fax { get; set; }


        [JsonIgnore]
        public List<Facturacion> Facturacion { get; set; } //Propiedad de Navegación
    }
}
