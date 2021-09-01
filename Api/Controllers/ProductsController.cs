using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Dto;
using Application.Queries;
using Application.Searches;
using Implementation.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public ProductsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Products
        [HttpGet]
        public IActionResult Get([FromQuery] ProductSearch search, [FromServices] IGetProductsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Products/5
        [HttpGet("{id}", Name = "GetProducts")]
        public IActionResult Get(int id, [FromServices] IGetProductQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Products
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromForm] ProductDto dto, [FromServices] ICreateProductCommand command)
        {
            dto.UploadImage();

            _executor.ExecuteCommand(command, dto);

            return StatusCode(StatusCodes.Status201Created);

        }

        // PUT: api/Products/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromForm] ProductDto dto, [FromServices] IUpdateProductCommand command)
        {
            dto.Id = id;

            dto.UploadImage();

            _executor.ExecuteCommand(command, dto);

            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteProductCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}
