using Application.Commands;
using Application.Dto;
using AutoMapper;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateUserCommand : ICreateUserCommand
    {
        private readonly DixotekaDbContext _context;
        private readonly CreateUserValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateUserCommand(DixotekaDbContext context, CreateUserValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 1;

        public string Name => "Create user command";

        public void Execute(UserDto request)
        {
            _validator.ValidateAndThrow(request);

            var newUser = _mapper.Map<User>(request);

            foreach (var item in request.AllowedUseCases)
            {
                newUser.UserUserCases.Add(new UserUseCase
                {
                    UseCaseId = item
                });
            }

            _context.Users.Add(newUser);
            _context.SaveChanges();
        }
    }
}
