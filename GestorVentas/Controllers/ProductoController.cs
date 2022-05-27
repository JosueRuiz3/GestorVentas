using GestorVentas.Data;
using GestorVentas.Models;
using Microsoft.AspNetCore.Mvc;

namespace GestorVentas.Controllers
{
    public class ProductoController : Controller
    {
        Dto_Producto _daProducto = new Dto_Producto();

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListaProducto()
        {
            List<Productos> oLista = new List<Productos>();
            oLista = _daProducto.Listar();
            return Json(new { data = oLista });
        }

        [HttpPost]
        public JsonResult GuardarProducto([FromBody] Productos obj)
        {
            string operacion = Request.Headers["operacion"];
            bool respuesta;

            if (operacion == "crear")
            {
                respuesta = _daProducto.Guardar(obj);
            }
            else
            {
                respuesta = _daProducto.Editar(obj);
            }


            return Json(new { respuesta = respuesta });
        }

        [HttpDelete]
        public JsonResult EliminarProducto(int idproducto)
        {
            bool respuesta;
            respuesta = _daProducto.Eliminar(idproducto);
            return Json(new { respuesta = respuesta });
        }
    }
}
