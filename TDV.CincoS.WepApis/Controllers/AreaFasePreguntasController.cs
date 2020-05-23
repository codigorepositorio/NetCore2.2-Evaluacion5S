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
    public class AreaFasePreguntasController : ControllerBase
    {
        private readonly AreaFasePreguntasRepository _repository;

        public AreaFasePreguntasController(AreaFasePreguntasRepository repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }



        [HttpGet("[action]")]
        //[HttpGet("Listado")]
        public async Task<ActionResult<IEnumerable<AreaFasePreguntasViewModel>>> Get()
        {
            var response = await _repository.Select();

            if (response == null) { return NotFound(); }
            return response;        
        }



        [HttpGet("{Id}")]
        public async Task<ActionResult<IEnumerable<AreaFasePreguntasViewModel>>> Get(int Id)
        {
            var response = await _repository.SelectId(Id);
            if (response == null) { return NotFound(); }
            return response;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Post([FromBody] AreaFasePreguntas value)
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
        public async Task<IActionResult> Put([FromBody] AreaFasePreguntas value)
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

        public async Task<IActionResult> Delete([FromBody] AreaFasePreguntas value)
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

    }
}