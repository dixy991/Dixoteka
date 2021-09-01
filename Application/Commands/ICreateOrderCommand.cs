using Application.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface ICreateOrderCommand : ICommand<OrderDto>
    {
    }

    public interface IDeleteOrderCommand : ICommand<int>
    {
    }

    public interface IUpdateOrderCommand : ICommand<OrderDto>
    {
    }
}
