using Application.Dto;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using DataAccess;
using Domain;
using Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EFGetOrdersQuery : IGetOrdersQuery
    {
        public int Id => 24;

        public string Name => "get orders query";

        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetOrdersQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public PagedResponse<OrderDto> Execute(OrderSearch search)
        {
            var orders = _context.Orders.Include(x => x.OrderLines).ThenInclude(x => x.Product).AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                search.Keyword = search.Keyword.ToLower().Trim();
                orders = orders.Where(x => x.City.ToLower().Contains(search.Keyword) || x.Address.ToLower().Contains(search.Keyword) || x.OrderLines.Any(x => x.Product.Name.ToLower().Contains(search.Keyword)));
            }

            return orders.Paged<OrderDto, Order>(search, _mapper);
        }
    }

    public class EFGetOrderQuery : IGetOrderQuery
    {
        public int Id => 25;

        public string Name => "get order query";

        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetOrderQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public OrderDto Execute(int search)
        {
            var order = _context.Orders.Include(x => x.OrderLines).ThenInclude(x => x.Product).FirstOrDefault(x => x.Id == search);

            if (order == null)
                throw new EntityNotFoundException(search, typeof(Order));

            return _mapper.Map<OrderDto>(order);
        }
    }
}
