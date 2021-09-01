using Application.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface ICreateUserCommand : ICommand<UserDto>
    {
    }

    public interface IDeleteUserCommand : ICommand<int>
    {
    }

    public interface IUpdateUserCommand : ICommand<UserDto>
    {
    }

    //use case i userusecase
}
