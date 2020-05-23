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
    public class FasesController : ControllerBase
    {
        private readonly FasesRepository _repository;

        public FasesController(FasesRepository repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        [ResponseCache(Duration = 60)]
        [HttpGet("[action]")]
       
        public async Task<ActionResult<IEnumerable<FasesViewModel>>> Get()
        {
            var response = await _repository.Select();
            if (response == null) { return NotFound(); }
            return response;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Post([FromBody] Fases value)
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
            //return BadRequest();

            return Ok();
        }

        [HttpPut("[action]")]
        public async Task<IActionResult> Put([FromBody] Fases value)
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
        public async Task<IActionResult> Delete([FromBody] Fases value)
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