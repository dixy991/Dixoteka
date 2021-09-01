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
    public class EFGetProductsQuery : IGetProductsQuery
    {
        public int Id => 11;

        public string Name => "get products query";

        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetProductsQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public PagedResponse<ProductDto> Execute(ProductSearch search)
        {
            var products = _context.Products.Include(x => x.Category).AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                search.Keyword = search.Keyword.ToLower().Trim();
                products = products.Where(x => x.Name.ToLower().Contains(search.Keyword) || x.Description.ToLower().Contains(search.Keyword));
            }
            //|| x.Category.Name.ToLower().Contains(search.Keyword)

            if (search.MinPrice.HasValue)
                products = products.Where(x => x.Price >= search.MinPrice);

            if (search.MaxPrice.HasValue)
                products = products.Where(x => x.Price <= search.MaxPrice);

            if (search.CategoryId.HasValue)
                products = products.Where(x => x.CategoryId == search.CategoryId);

            if (search.IsNew.HasValue)
                products = products.Where(x => x.IsNew == search.IsNew);

            return products.Paged<ProductDto, Product>(search, _mapper);
        }
    }

    public class EFGetProductQuery : IGetProductQuery
    {
        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetProductQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 12;

        public string Name => "get product query";

        public ProductDto Execute(int id)
        {
            var product = _context.Products.Find(id);

            if (product == null)
                throw new EntityNotFoundException(id, typeof(Product));

            return _mapper.Map<ProductDto>(product);
        }
    }
}
