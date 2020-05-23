using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TDV.CincoS.DataLayer;
using TDV.CincoS.EntityLayer;

namespace TDV.CincoS.WepApis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TablasController : ControllerBase
    {
        private readonly TablasRepository _repository;

        public TablasController(TablasRepository repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }
        [HttpPost("[action]")]
        public async Task<IActionResult> Post()
        {          
            try
            {
                await _repository.Clear();
            }
            catch (Exception ex)
            {
                // Guardar Excepción
                return BadRequest(ex.Message.ToString());
            }

            return Ok();
        }
    }
}