using Application.Commands;
using Application.Dto;
using Application.Exceptions;
using AutoMapper;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly DixotekaDbContext _context;
        private readonly UpdateUserValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateUserCommand(DixotekaDbContext context, UpdateUserValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 9;

        public string Name => "update user command";

        public void Execute(UserDto request)
        {
            var user = _context.Users.Include(x => x.UserUserCases).FirstOrDefault(x => x.Id == request.Id);

            if (user == null)
                throw new EntityNotFoundException(request.Id, typeof(User));

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, user);

            user.UserUserCases.Clear();

            foreach (var item in request.AllowedUseCases)
            {
                user.UserUserCases.Add(new UserUseCase
                {
                    UseCaseId = item
                });
            }

            _context.SaveChanges();
        }
    }
}
