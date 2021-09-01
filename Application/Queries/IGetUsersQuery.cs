using Application.Dto;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetUsersQuery : IQuery<UserSearch, PagedResponse<UserDto>>
    {
    }

    public interface IGetUserQuery : IQuery<int, UserDto>
    {
    }
}
