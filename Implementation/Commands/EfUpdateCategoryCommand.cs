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
    public class EfUpdateCategoryCommand : IUpdateCategoryCommand
    {
        private readonly DixotekaDbContext _context;
        private readonly UpdateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateCategoryCommand(DixotekaDbContext context, UpdateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 7;

        public string Name => "update category command";

        public void Execute(CategoryDto request)
        {
            var category = _context.Categories.Find(request.Id);

            if (category == null)
                throw new EntityNotFoundException(request.Id, typeof(Category));

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, category);

            _context.SaveChanges();
        }
    }
}
