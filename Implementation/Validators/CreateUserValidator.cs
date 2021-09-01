using Application.Dto;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateUserValidator : AbstractValidator<UserDto>
    {
        public CreateUserValidator(DixotekaDbContext context)
        {
            RuleFor(x => x.FirstName).NotEmpty().WithMessage("First name is required.");
            RuleFor(x => x.LastName).NotEmpty().WithMessage("Last name is required.");
            RuleFor(x => x.Password).NotEmpty().WithMessage("Password is required.").MinimumLength(7).WithMessage("Password must have at least 7 characters.");
            RuleFor(x => x.Email).NotEmpty().WithMessage("Email is required.").EmailAddress().WithMessage("Email has to contain @ in it.");
            //da bude unique samo
            RuleFor(x => x.Username).NotEmpty().WithMessage("Username is required.").DependentRules(() =>
            {
                RuleFor(x => x.Username).Must(u => !context.Users.Any(x => x.Username == u)).WithMessage("That username is already taken!");
            });
        }
    }
}
