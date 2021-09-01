using Application.Dto;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetOrdersQuery : IQuery<OrderSearch, PagedResponse<OrderDto>>
    {
    }

    public interface IGetOrderQuery : IQuery<int, OrderDto>
    {
    }
}
