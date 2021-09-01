using Application.Dto;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetProductsQuery : IQuery<ProductSearch, PagedResponse<ProductDto>>
    {
    }

    public interface IGetProductQuery : IQuery<int, ProductDto>
    {
    }
}
