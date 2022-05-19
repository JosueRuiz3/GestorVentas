using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestorVentas.Models
{
    public class Proveedores
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Nombre de la Compañia")]
        public string Compañia { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Nombre Del Representante")]
        public string NombreRepresentante { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Teléfono")]
        public string Telefono { get; set; }


        [JsonIgnore]
        public List<Productos> Productos { get; set; }//Propiedad de Navegación
    }
}
