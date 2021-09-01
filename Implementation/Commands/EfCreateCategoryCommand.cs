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
    public class EfCreateCategoryCommand : ICreateCategoryCommand
    {
        private readonly DixotekaDbContext _context;
        private readonly CreateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateCategoryCommand(DixotekaDbContext context, CreateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 3;

        public string Name => "create category command";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Categories.Add(_mapper.Map<Category>(request));

            _context.SaveChanges();
        }
    }
}
