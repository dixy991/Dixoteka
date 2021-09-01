using Application.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetCartQuery : IQuery<int, FullCartDto>
    {
    }
}
