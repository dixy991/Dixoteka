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
    public class EFGetUsersQuery : IGetUsersQuery
    {
        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetUsersQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 2;

        public string Name => "get users query";

        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var users = _context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                search.Keyword = search.Keyword.ToLower().Trim();
                users = users.Where(x => x.Username.ToLower().Contains(search.Keyword) || x.FirstName.ToLower().Contains(search.Keyword) || x.LastName.ToLower().Contains(search.Keyword) || x.Email.ToLower().Contains(search.Keyword));
            }

            return users.Paged<UserDto, User>(search, _mapper);
        }
    }

    public class EFGetUserQuery : IGetUserQuery
    {
        private readonly DixotekaDbContext _context;
        private readonly IMapper _mapper;

        public EFGetUserQuery(DixotekaDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 35;

        public string Name => "get user query";

        public UserDto Execute(int id)
        {
            var user = _context.Users.Find(id);

            if (user == null)
                throw new EntityNotFoundException(id, typeof(User));

            return _mapper.Map<UserDto>(user);
        }
    }
}
