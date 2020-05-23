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
    public class PreguntasController : ControllerBase
    {
        private readonly PreguntasRepository _repository;

        public PreguntasController(PreguntasRepository repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        //[ResponseCache(Duration = 60)]
        [HttpGet("{opc}")]

        public async Task<ActionResult<IEnumerable<Preguntas>>> Get(string opc)
        {
            var response = await _repository.Select(opc);
            if (response == null) { return NotFound(); }
            return response;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Post([FromBody] Preguntas value)
        {          
            try
            {
                await _repository.Insert(value);
            }
            catch (Exception ex)
            {
                // Guardar Excepción
                return BadRequest(ex.Message.ToString());
            }

            return Ok();
        }

        [HttpPut("[action]")]
        public async Task<IActionResult> Put([FromBody] Preguntas value)
        {            
            try
            {
                await _repository.Update(value);
            }
            catch (Exception ex)
            {
                // Guardar Excepción
                return BadRequest(ex.Message.ToString());
            }

            return Ok();
        }

        [HttpPut("[action]")]
        public async Task<IActionResult> Delete([FromBody] Preguntas value)
        {
            try
            {
                await _repository.Delete(value);
            }
            catch (Exception ex)
            {
                // Guardar Excepción
                return BadRequest(ex);
            }

           return Ok();
            
        }

        [HttpPut("[action]")]
        public async Task<IActionResult> Habilitar([FromBody] Preguntas value)
        {
            try
            {
                await _repository.Habilitar(value);
            }
            catch (Exception ex)
            {
                // Guardar Excepción
                return BadRequest(ex);
            }

            return Ok();

        }
    }
}