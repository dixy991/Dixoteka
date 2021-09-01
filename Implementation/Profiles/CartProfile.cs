using Application.Dto;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Profiles
{
    public class CartProfile : Profile
    {
        public CartProfile()
        {
            CreateMap<Cart, CartDto>().ForMember(x => x.ProductName, opt => opt.MapFrom(x => x.Product.Name)).ForMember(x => x.Price, opt => opt.MapFrom(x => x.Product.Price));
            CreateMap<CartDto, Cart>();
        }
    }
}
