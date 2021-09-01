using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Dto;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UsersController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        [Authorize]
        // GET: api/Users
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearch search,[FromServices] IGetUsersQuery query)
        {;
            return Ok(_executor.ExecuteQuery(query, search));
        }
        [Authorize]
        // GET: api/Users/5
        [HttpGet("{id}", Name = "Users")]
        public IActionResult Get(int id, [FromServices] IGetUserQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Users
        [HttpPost]
        public IActionResult Post([FromBody] UserDto user, [FromServices] ICreateUserCommand command)
        {
            _executor.ExecuteCommand(command, user);

            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Users/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserDto dto, [FromServices] IUpdateUserCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);

            return NoContent();
        }

        // DELETE: api/ApiWithActions/5 
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}
