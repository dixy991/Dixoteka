using Application;
using Application.Commands;
using Application.Dto;
using AutoMapper;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateCartCommand : ICreateCartCommand
    {
        private readonly DixotekaDbContext _context;
        private readonly CreateCartValidator _validator;
        private readonly IMapper _mapper;
        private readonly IAppActor _actor;

        public EfCreateCartCommand(DixotekaDbContext context, CreateCartValidator validator, IMapper mapper, IAppActor actor)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
            _actor = actor;
        }

        public int Id => 21;

        public string Name => "create cart command";

        public void Execute(CartDto request)
        {
            request.UserId = _actor.Id;

            _validator.ValidateAndThrow(request);

            _context.Products.Find(request.ProductId).Quantity -= request.Quantity;

            var vecima = _context.Carts.FirstOrDefault(x => x.UserId == request.UserId && x.ProductId == request.ProductId);

            if (vecima != null)
                vecima.Quantity += request.Quantity;
            else
                _context.Carts.Add(_mapper.Map<Cart>(request));

            _context.SaveChanges();
        }
    }
}
