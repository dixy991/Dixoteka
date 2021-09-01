using Application.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface ICreateCategoryCommand : ICommand<CategoryDto>
    {
    }

    public interface IDeleteCategoryCommand : ICommand<int>
    {
    }

    public interface IUpdateCategoryCommand : ICommand<CategoryDto>
    {
    }
}
