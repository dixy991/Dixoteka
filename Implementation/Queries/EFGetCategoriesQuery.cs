using Application.Dto;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using DataAccess;
using Domain;
using Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EFGetCategoriesQuery : IGetCategoriesQuery
    {
        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetCategoriesQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 4;

        public string Name => "get categories query";

        public PagedResponse<CategoryDto> Execute(CategorySearch search)
        {
            var categories = _context.Categories.AsQueryable();

            if(!string.IsNullOrEmpty(search.Name))
            {
                search.Name = search.Name.ToLower().Trim();
                categories = categories.Where(x => x.Name.ToLower().Contains(search.Name));
            }

            return categories.Paged<CategoryDto, Category>(search, _mapper);
        }
    }

    public class EFGetCategoryQuery : IGetCategoryQuery
    {
        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetCategoryQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 5;

        public string Name => "get category query";

        public CategoryDto Execute(int id)
        {
            var category = _context.Categories.Find(id);

            if (category == null)
                throw new EntityNotFoundException(id, typeof(Category));

            return (_mapper.Map<CategoryDto>(category));
        }
    }
}
