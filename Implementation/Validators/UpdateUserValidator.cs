using Application.Dto;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateUserValidator : AbstractValidator<UserDto>
    {
        public UpdateUserValidator(DixotekaDbContext context)
        {
            //
            RuleFor(x => x.Username).NotEmpty().WithMessage("Username is required").DependentRules(() =>
            {
                RuleFor(x => x.Username).Must((dto, un) => !context.Users.Any(x => x.Username == un && x.Id != dto.Id)).WithMessage("This username is already taken!");
            });
            //pa nije obavezno 
            RuleFor(x => x.FirstName).NotEmpty().WithMessage("FirstName is required");
            RuleFor(x => x.LastName).NotEmpty().WithMessage("LastName is required");
            RuleFor(x => x.Password).NotEmpty().WithMessage("Password is required");
            RuleFor(x => x.Email).NotEmpty().WithMessage("Email is required");
        }
    }
}
