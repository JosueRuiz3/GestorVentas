using System.ComponentModel.DataAnnotations;

namespace GestorVentas.Models
{
    public class Categorias
    {
        public int IdCategoria { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Nombre Categoria")]
        [StringLength(20, ErrorMessage = "No más de 20 caracteres")]
        public string NombreCategoria { get; set; }

        [Display(Name = "Descripcion")]
        [StringLength(100, ErrorMessage = "No más de 100 caracteres")]
        public string Descripcion { get; set; }

        public List<Productos> Productos { get; set; }//Propiedad de Navegación
    }
}
