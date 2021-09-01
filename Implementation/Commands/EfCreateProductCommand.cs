using Application.Commands;
using Application.Dto;
using AutoMapper;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateProductCommand : ICreateProductCommand
    {
        private readonly DixotekaDbContext _context;
        private readonly UpdateProductValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateProductCommand(DixotekaDbContext context, UpdateProductValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 10;

        public string Name => "create product command";

        public void Execute(ProductDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Products.Add(_mapper.Map<Product>(request));

            _context.SaveChanges();
        }
    }
}
