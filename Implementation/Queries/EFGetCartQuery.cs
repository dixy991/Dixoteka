using Application.Dto;
using Application.Exceptions;
using Application.Queries;
using AutoMapper;
using DataAccess;
using Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EFGetCartQuery : IGetCartQuery
    {
        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetCartQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 20;

        public string Name => "get cart";

        public FullCartDto Execute(int search)
        {
            var cart = _context.Carts.Include(x => x.Product).Where(x => x.UserId == search).ToList();

            if (cart == null)
                throw new EntityNotFoundException(search, typeof(Cart));

            var all = new List<CartDto>();
            decimal total = 0;

            foreach (var item in cart)
            {
                total += item.Product.Price * item.Quantity;
                all.Add(_mapper.Map<CartDto>(item));
            }

            var fullcart = new FullCartDto
            {
                Items = all,
                Total = total
            };

            return fullcart;

        }
    }
}
