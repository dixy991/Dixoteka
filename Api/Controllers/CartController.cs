using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Dto;
using Application.Queries;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public CartController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Cart/5
        [HttpGet("{id}", Name = "GetCart")]
        public IActionResult Get(int id, [FromServices] IGetCartQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Cart
        [HttpPost]
        public IActionResult Post([FromBody] CartDto dto, [FromServices] ICreateCartCommand command)
        {
            _executor.ExecuteCommand(command, dto);

            return StatusCode(StatusCodes.Status201Created);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCartCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}
