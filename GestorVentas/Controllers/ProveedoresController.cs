using Microsoft.AspNetCore.Mvc;
using GestorVentas.Data;
using GestorVentas.Models;

namespace GestorVentas.Controllers
{
    public class ProveedoresController : Controller
    {
        Dto_Proveedores _daProveedores = new Dto_Proveedores();

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListaProveedores()
        {
            List<Proveedores> oLista = new List<Proveedores>();
            oLista = _daProveedores.Listar();
            return Json(new { data = oLista });
        }

        [HttpPost]
        public JsonResult GuardarProveedores([FromBody] Proveedores obj)
        {
            string operacion = Request.Headers["operacion"];
            bool respuesta;

            if (operacion == "crear")
            {
                respuesta = _daProveedores.Guardar(obj);
            }
            else
            {
                respuesta = _daProveedores.Editar(obj);
            }


            return Json(new { respuesta = respuesta });
        }

        [HttpDelete]
        public JsonResult EliminarProveedores(int idcategoria)
        {
            bool respuesta;
            respuesta = _daProveedores.Eliminar(idcategoria);
            return Json(new { respuesta = respuesta });
        }
    }
}
