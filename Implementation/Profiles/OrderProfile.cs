using Application.Dto;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Profiles
{
    public class OrderProfile : Profile
    {
        public OrderProfile()
        {
            CreateMap<Order, OrderDto>().ForMember(x => x.Items, opt => opt.MapFrom(order => order.OrderLines.Select(ol => new CartDto
            {
                Quantity = ol.Quantity,
                Price = ol.Price,
                ProductName = ol.Product.Name,
            })));
            CreateMap<OrderDto, Order>();
            //ne radi
            //CreateMap<OrderDto, Order>().ForMember(x => x.OrderLines, opt => opt.MapFrom(dto => dto.Items.Select(ol => new OrderLine
            //{
            //    ProductId = ol.ProductId,
            //    Quantity = ol.Quantity,
            //    Name = ol.ProductName,
            //    Price = ol.Price
            //})));
        }
    }
}
