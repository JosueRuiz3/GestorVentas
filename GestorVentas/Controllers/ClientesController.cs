using GestorVentas.Data;
using GestorVentas.Models;
using Microsoft.AspNetCore.Mvc;

namespace GestorVentas.Controllers
{
    public class ClientesController : Controller
    {
        Dto_Clientes _daClientes = new Dto_Clientes();

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListaCliente()
        {
            List<Clientes> oLista = new List<Clientes>();
            oLista = _daClientes.Listar();
            return Json(new { data = oLista });
        }

        [HttpPost]
        public JsonResult GuardarCliente([FromBody] Clientes obj)
        {
            string operacion = Request.Headers["operacion"];
            bool respuesta;

            if (operacion == "crear")
            {
                respuesta = _daClientes.Guardar(obj);
            }
            else
            {
                respuesta = _daClientes.Editar(obj);
            }


            return Json(new { respuesta = respuesta });
        }

        [HttpDelete]
        public JsonResult EliminarCliente(int idcliente)
        {
            bool respuesta;
            respuesta = _daClientes.Eliminar(idcliente);
            return Json(new { respuesta = respuesta });
        }
    }
}
