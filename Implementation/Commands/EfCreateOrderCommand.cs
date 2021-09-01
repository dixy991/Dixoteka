using Application;
using Application.Commands;
using Application.Dto;
using Application.Email;
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
    public class EfCreateOrderCommand : ICreateOrderCommand
    {
        private readonly DixotekaDbContext _context;
        private readonly CreateOrderValidator _validator;
        private readonly IEmailSender _sender;
        private readonly IMapper _mapper;
        private readonly IAppActor _actor;

        public EfCreateOrderCommand(DixotekaDbContext context, CreateOrderValidator validator, IEmailSender sender, IMapper mapper, IAppActor actor)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
            _mapper = mapper;
            _actor = actor;
        }

        public int Id => 24;

        public string Name => "create order command";

        public void Execute(OrderDto request)
        {
            request.UserId = _actor.Id;

            _validator.ValidateAndThrow(request);

            var usersEmail = _context.Users.Find(request.UserId).Email;

            var order = _mapper.Map<Order>(request);

            var usersCart = _context.Carts.Where(x => x.UserId == request.UserId).ToList();

            foreach (var item in usersCart)
            {
                var product = _context.Products.Find(item.ProductId);

                order.OrderLines.Add(new OrderLine
                {
                    ProductId = item.ProductId,
                    Quantity = item.Quantity,
                    Name = product.Name,
                    Price = product.Price
                });
            }

            var cart = _context.Carts.Where(x => x.UserId == request.UserId);

            _context.Carts.RemoveRange(cart);

            _context.Orders.Add(order);

            _context.SaveChanges();

            _sender.Send(new SendEmailDto
            {
                SendTo = usersEmail,
                Subject = "New order in Dixoteka",
                Content = "You have successfully made an order! We will keep you updated on its delivery."
            });
        }
    }
}
