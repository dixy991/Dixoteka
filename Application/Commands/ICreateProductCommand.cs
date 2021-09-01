using Application.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface ICreateProductCommand : ICommand<ProductDto>
    {
    }

    public interface IDeleteProductCommand : ICommand<int>
    {
    }

    public interface IUpdateProductCommand : ICommand<ProductDto>
    {
    }
}
