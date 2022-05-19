using GestorVentas.Data;
using GestorVentas.Models;
using Microsoft.AspNetCore.Mvc;

namespace GestorVentas.Controllers
{
    public class CategoriasController : Controller
    {
        Dto_Categoria _daCategoria = new Dto_Categoria();

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListaCategoria()
        {
            List<Categorias> oLista = new List<Categorias>();
            oLista = _daCategoria.Listar();
            return Json(new { data = oLista });
        }

        [HttpPost]
        public JsonResult GuardarCategoria([FromBody] Categorias obj)
        {
            string operacion = Request.Headers["operacion"];
            bool respuesta;

            if (operacion == "crear")
            {
                respuesta = _daCategoria.Guardar(obj);
            }
            else
            {
                respuesta = _daCategoria.Editar(obj);
            }


            return Json(new { respuesta = respuesta });
        }

        [HttpDelete]
        public JsonResult EliminarCategoria(int idcategoria)
        {
            bool respuesta;
            respuesta = _daCategoria.Eliminar(idcategoria);
            return Json(new { respuesta = respuesta });
        }
    }
}
