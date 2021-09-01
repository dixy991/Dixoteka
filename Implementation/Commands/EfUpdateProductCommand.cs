using Application.Commands;
using Application.Dto;
using Application.Exceptions;
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
    public class EfUpdateProductCommand : IUpdateProductCommand
    {
        private readonly DixotekaDbContext _context;
        private readonly UpdateProductValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateProductCommand(DixotekaDbContext context, UpdateProductValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 14;

        public string Name => "update product command";

        public void Execute(ProductDto request)
        {
            var product = _context.Products.Find(request.Id);

            if (product == null)
                throw new EntityNotFoundException(request.Id, typeof(Product));

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, product);

            _context.SaveChanges();
        }
    }
}
